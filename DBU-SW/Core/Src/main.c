/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.c
  * @brief          : Main program body
  ******************************************************************************
  * @attention
  *
  * Copyright (c) 2023 STMicroelectronics.
  * All rights reserved.
  *
  * This software is licensed under terms that can be found in the LICENSE file
  * in the root directory of this software component.
  * If no LICENSE file comes with this software, it is provided AS-IS.
  *
  ******************************************************************************
  */
/* USER CODE END Header */
/* Includes ------------------------------------------------------------------*/
#include "main.h"
#include "cmsis_os.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "can1.h"
#include "lvgl.h"
#include "lv_dashboard_unit.h"
#include "display.h"
#include "indev/touch.h"
#include "otm8009a.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
typedef StaticTask_t osStaticThreadDef_t;
typedef StaticQueue_t osStaticMessageQDef_t;
typedef StaticSemaphore_t osStaticMutexDef_t;
/* USER CODE BEGIN PTD */



/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/
CAN_HandleTypeDef hcan3;

DSI_HandleTypeDef hdsi;

I2C_HandleTypeDef hi2c2;

LTDC_HandleTypeDef hltdc;

/* Definitions for defaultTask */
osThreadId_t defaultTaskHandle;
const osThreadAttr_t defaultTask_attributes = {
  .name = "defaultTask",
  .stack_size = 128 * 4,
  .priority = (osPriority_t) osPriorityNormal,
};
/* Definitions for lvgl */
osThreadId_t lvglHandle;
uint32_t lvglBuffer[ 2048 ];
osStaticThreadDef_t lvglControlBlock;
const osThreadAttr_t lvgl_attributes = {
  .name = "lvgl",
  .cb_mem = &lvglControlBlock,
  .cb_size = sizeof(lvglControlBlock),
  .stack_mem = &lvglBuffer[0],
  .stack_size = sizeof(lvglBuffer),
  .priority = (osPriority_t) osPriorityLow,
};
/* Definitions for indicators */
osThreadId_t indicatorsHandle;
uint32_t indicatorsBuffer[ 128 ];
osStaticThreadDef_t indicatorsControlBlock;
const osThreadAttr_t indicators_attributes = {
  .name = "indicators",
  .cb_mem = &indicatorsControlBlock,
  .cb_size = sizeof(indicatorsControlBlock),
  .stack_mem = &indicatorsBuffer[0],
  .stack_size = sizeof(indicatorsBuffer),
  .priority = (osPriority_t) osPriorityNormal,
};
/* Definitions for canRX */
osThreadId_t canRXHandle;
uint32_t canRXBuffer[ 512 ];
osStaticThreadDef_t canRXControlBlock;
const osThreadAttr_t canRX_attributes = {
  .name = "canRX",
  .cb_mem = &canRXControlBlock,
  .cb_size = sizeof(canRXControlBlock),
  .stack_mem = &canRXBuffer[0],
  .stack_size = sizeof(canRXBuffer),
  .priority = (osPriority_t) osPriorityHigh1,
};
/* Definitions for canTX */
osThreadId_t canTXHandle;
uint32_t canTXBuffer[ 512 ];
osStaticThreadDef_t canTXControlBlock;
const osThreadAttr_t canTX_attributes = {
  .name = "canTX",
  .cb_mem = &canTXControlBlock,
  .cb_size = sizeof(canTXControlBlock),
  .stack_mem = &canTXBuffer[0],
  .stack_size = sizeof(canTXBuffer),
  .priority = (osPriority_t) osPriorityNormal,
};
/* Definitions for indicatorsQueue */
osMessageQueueId_t indicatorsQueueHandle;
uint8_t indicatorsQueueBuffer[ 1 * sizeof( indicators_t ) ];
osStaticMessageQDef_t indicatorsQueueControlBlock;
const osMessageQueueAttr_t indicatorsQueue_attributes = {
  .name = "indicatorsQueue",
  .cb_mem = &indicatorsQueueControlBlock,
  .cb_size = sizeof(indicatorsQueueControlBlock),
  .mq_mem = &indicatorsQueueBuffer,
  .mq_size = sizeof(indicatorsQueueBuffer)
};
/* Definitions for lvgl_mutex */
osMutexId_t lvgl_mutexHandle;
osStaticMutexDef_t lvgl_mutexControlBlock;
const osMutexAttr_t lvgl_mutex_attributes = {
  .name = "lvgl_mutex",
  .cb_mem = &lvgl_mutexControlBlock,
  .cb_size = sizeof(lvgl_mutexControlBlock),
};
/* USER CODE BEGIN PV */
const uint8_t canRxFifo0MsgPending = (1 << 0);
const uint8_t canRxFifo1MsgPending = (1 << 1);

DSI_LPCmdTypeDef dsiLPCmdInit = { 0 };
/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
static void MX_GPIO_Init(void);
static void MX_CAN3_Init(void);
static void MX_DSIHOST_DSI_Init(void);
static void MX_LTDC_Init(void);
static void MX_I2C2_Init(void);
void StartDefaultTask(void *argument);
void lvglTask(void *argument);
void indicatorsTask(void *argument);
void canRXTask(void *argument);
void canTXTask(void *argument);

/* USER CODE BEGIN PFP */
void LCD_Reset(void);

/* LCD Display IO functions */
void DSI_IO_WriteCmd(uint32_t NbrParams, uint8_t *pParams);

/* TouchScreen (TS) IO functions */
void TS_IO_Init(void);
void TS_IO_Write(uint8_t Addr, uint8_t Reg, uint8_t Value);
uint8_t TS_IO_Read(uint8_t Addr, uint8_t Reg);
uint16_t TS_IO_ReadMultiple(uint8_t Addr, uint8_t Reg, uint8_t *Buffer,
		uint16_t Length);
void TS_IO_WriteMultiple(uint8_t Addr, uint8_t Reg, uint8_t *Buffer,
		uint16_t Length);
void TS_IO_Delay(uint32_t Delay);

static HAL_StatusTypeDef I2Cx_ReadMultiple(I2C_HandleTypeDef *i2c_handler,
		uint8_t Addr, uint16_t Reg, uint16_t MemAddSize, uint8_t *Buffer,
		uint16_t Length);
static HAL_StatusTypeDef I2Cx_WriteMultiple(I2C_HandleTypeDef *i2c_handler,
		uint8_t Addr, uint16_t Reg, uint16_t MemAddSize, uint8_t *Buffer,
		uint16_t Length);
static void I2Cx_Error(I2C_HandleTypeDef *i2c_handler, uint8_t Addr);
/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

/* USER CODE END 0 */

/**
  * @brief  The application entry point.
  * @retval int
  */
int main(void)
{
  /* USER CODE BEGIN 1 */

  /* USER CODE END 1 */

  /* Enable I-Cache---------------------------------------------------------*/
  SCB_EnableICache();

  /* Enable D-Cache---------------------------------------------------------*/
  SCB_EnableDCache();

  /* MCU Configuration--------------------------------------------------------*/

  /* Reset of all peripherals, Initializes the Flash interface and the Systick. */
  HAL_Init();

  /* USER CODE BEGIN Init */
  lv_init();
  disp_init();
  //touch_init();
  /* USER CODE END Init */

  /* Configure the system clock */
  SystemClock_Config();

  /* USER CODE BEGIN SysInit */

  /* USER CODE END SysInit */

  /* Initialize all configured peripherals */
  MX_GPIO_Init();
  MX_CAN3_Init();
  MX_DSIHOST_DSI_Init();
  MX_LTDC_Init();
  MX_I2C2_Init();
  /* USER CODE BEGIN 2 */
  /* LCD Display Hw reset through XRES signal*/
  	LCD_Reset();
  	/*Start the DSI Host. This will enable DSI Host and Wrapper. This must be
  	 done after the LTDC has been enabled*/
  	HAL_DSI_Start(&hdsi);
  	/*LCD Display initialization: This will send display init commands.
  	 Arguments are color format and orientation. Color format must be consistent
  	 with DSI Host color format*/
  	OTM8009A_Init(OTM8009A_FORMAT_RGB888, OTM8009A_ORIENTATION_LANDSCAPE);
  	/*Max brightness*/
  	HAL_DSI_ShortWrite(&hdsi, 0, DSI_DCS_SHORT_PKT_WRITE_P1,
  	OTM8009A_CMD_WRDISBV, 0xFF);
  	/*Enable HS transmission of commands. This is in case Display init has been
  	 done in LP as required by some displays*/
  	/* Wait for 10ms before stopping the DSI*/
  	HAL_Delay(20);
  	/* Stop the DSI and reconfigure the DCS Long Write in High Speed only,
  	 since display refresh is done with DCS Long Write commands*/
  	HAL_DSI_Stop(&hdsi);
  	/* Configure the command mode */
  	dsiLPCmdInit.LPGenShortWriteNoP = DSI_LP_GSW0P_ENABLE;
  	dsiLPCmdInit.LPGenShortWriteOneP = DSI_LP_GSW1P_ENABLE;
  	dsiLPCmdInit.LPGenShortWriteTwoP = DSI_LP_GSW2P_ENABLE;
  	dsiLPCmdInit.LPGenShortReadNoP = DSI_LP_GSR0P_ENABLE;
  	dsiLPCmdInit.LPGenShortReadOneP = DSI_LP_GSR1P_ENABLE;
  	dsiLPCmdInit.LPGenShortReadTwoP = DSI_LP_GSR2P_ENABLE;
  	dsiLPCmdInit.LPGenLongWrite = DSI_LP_GLW_ENABLE;
  	dsiLPCmdInit.LPDcsShortWriteNoP = DSI_LP_DSW0P_ENABLE;
  	dsiLPCmdInit.LPDcsShortWriteOneP = DSI_LP_DSW1P_ENABLE;
  	dsiLPCmdInit.LPDcsShortReadNoP = DSI_LP_DSR0P_ENABLE;
  	dsiLPCmdInit.LPDcsLongWrite = DSI_LP_DLW_DISABLE;
  	dsiLPCmdInit.LPMaxReadPacket = DSI_LP_MRDP_ENABLE;
  	dsiLPCmdInit.AcknowledgeRequest = DSI_ACKNOWLEDGE_DISABLE;
  	/* Init the command mode */
  	HAL_DSI_ConfigCommand(&hdsi, &dsiLPCmdInit);

  	HAL_DSI_Start(&hdsi);
  	/* Manual refresh. This will enable LTDCEN bit in the DSI Wrapper Control
  	 register */

  	HAL_DSI_Refresh(&hdsi);
  	/* Wait for 10ms before starting to draw pixels*/
  	HAL_Delay(20);


  	HAL_CAN_Start(&hcan3);
  //HAL_CAN_ActivateNotification(&hcan3, CAN_IT_RX_FIFO0_MSG_PENDING | CAN_IT_RX_FIFO1_MSG_PENDING);
  lv_dashboard();
  HAL_GPIO_WritePin(IMD_ERROR_GPIO_Port, IMD_ERROR_Pin, GPIO_PIN_SET);

  HAL_GPIO_WritePin(AMS_ERROR_GPIO_Port, AMS_ERROR_Pin, GPIO_PIN_SET);
  //  HAL_GPIO_WritePin(EBS_ERROR_GPIO_Port, EBS_ERROR_Pin, GPIO_PIN_SET);
    HAL_Delay(2000);
    HAL_GPIO_WritePin(IMD_ERROR_GPIO_Port, IMD_ERROR_Pin, GPIO_PIN_RESET);
      HAL_GPIO_WritePin(AMS_ERROR_GPIO_Port, AMS_ERROR_Pin, GPIO_PIN_RESET);
     // HAL_GPIO_WritePin(EBS_ERROR_GPIO_Port, EBS_ERROR_Pin, GPIO_PIN_RESET);

  /* USER CODE END 2 */

  /* Init scheduler */
  osKernelInitialize();
  /* Create the mutex(es) */
  /* creation of lvgl_mutex */
  lvgl_mutexHandle = osMutexNew(&lvgl_mutex_attributes);

  /* USER CODE BEGIN RTOS_MUTEX */
  /* add mutexes, ... */
  /* USER CODE END RTOS_MUTEX */

  /* USER CODE BEGIN RTOS_SEMAPHORES */
  /* add semaphores, ... */
  /* USER CODE END RTOS_SEMAPHORES */

  /* USER CODE BEGIN RTOS_TIMERS */
  /* start timers, add new ones, ... */
  /* USER CODE END RTOS_TIMERS */

  /* Create the queue(s) */
  /* creation of indicatorsQueue */
  indicatorsQueueHandle = osMessageQueueNew (1, sizeof(indicators_t), &indicatorsQueue_attributes);

  /* USER CODE BEGIN RTOS_QUEUES */
  /* add queues, ... */
  /* USER CODE END RTOS_QUEUES */

  /* Create the thread(s) */
  /* creation of defaultTask */
  defaultTaskHandle = osThreadNew(StartDefaultTask, NULL, &defaultTask_attributes);

  /* creation of lvgl */
  lvglHandle = osThreadNew(lvglTask, NULL, &lvgl_attributes);

  /* creation of indicators */
  indicatorsHandle = osThreadNew(indicatorsTask, NULL, &indicators_attributes);

  /* creation of canRX */
  canRXHandle = osThreadNew(canRXTask, NULL, &canRX_attributes);

  /* creation of canTX */
  canTXHandle = osThreadNew(canTXTask, NULL, &canTX_attributes);

  /* USER CODE BEGIN RTOS_THREADS */
  /* add threads, ... */
  /* USER CODE END RTOS_THREADS */

  /* USER CODE BEGIN RTOS_EVENTS */
  /* add events, ... */
  /* USER CODE END RTOS_EVENTS */

  /* Start scheduler */
  osKernelStart();

  /* We should never get here as control is now taken by the scheduler */
  /* Infinite loop */
  /* USER CODE BEGIN WHILE */
  while (1)
  {
    /* USER CODE END WHILE */

    /* USER CODE BEGIN 3 */
  }
  /* USER CODE END 3 */
}

/**
  * @brief System Clock Configuration
  * @retval None
  */
void SystemClock_Config(void)
{
  RCC_OscInitTypeDef RCC_OscInitStruct = {0};
  RCC_ClkInitTypeDef RCC_ClkInitStruct = {0};

  /** Configure the main internal regulator output voltage
  */
  __HAL_RCC_PWR_CLK_ENABLE();
  __HAL_PWR_VOLTAGESCALING_CONFIG(PWR_REGULATOR_VOLTAGE_SCALE1);

  /** Initializes the RCC Oscillators according to the specified parameters
  * in the RCC_OscInitTypeDef structure.
  */
  RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSE;
  RCC_OscInitStruct.HSEState = RCC_HSE_ON;
  RCC_OscInitStruct.PLL.PLLState = RCC_PLL_ON;
  RCC_OscInitStruct.PLL.PLLSource = RCC_PLLSOURCE_HSE;
  RCC_OscInitStruct.PLL.PLLM = 12;
  RCC_OscInitStruct.PLL.PLLN = 192;
  RCC_OscInitStruct.PLL.PLLP = RCC_PLLP_DIV2;
  RCC_OscInitStruct.PLL.PLLQ = 2;
  RCC_OscInitStruct.PLL.PLLR = 2;
  if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK)
  {
    Error_Handler();
  }

  /** Activate the Over-Drive mode
  */
  if (HAL_PWREx_EnableOverDrive() != HAL_OK)
  {
    Error_Handler();
  }

  /** Initializes the CPU, AHB and APB buses clocks
  */
  RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK|RCC_CLOCKTYPE_SYSCLK
                              |RCC_CLOCKTYPE_PCLK1|RCC_CLOCKTYPE_PCLK2;
  RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_PLLCLK;
  RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
  RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV4;
  RCC_ClkInitStruct.APB2CLKDivider = RCC_HCLK_DIV2;

  if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_6) != HAL_OK)
  {
    Error_Handler();
  }
}

/**
  * @brief CAN3 Initialization Function
  * @param None
  * @retval None
  */
static void MX_CAN3_Init(void)
{

  /* USER CODE BEGIN CAN3_Init 0 */

  /* USER CODE END CAN3_Init 0 */

  /* USER CODE BEGIN CAN3_Init 1 */

  /* USER CODE END CAN3_Init 1 */
  hcan3.Instance = CAN3;
  hcan3.Init.Prescaler = 5;
  hcan3.Init.Mode = CAN_MODE_NORMAL;
  hcan3.Init.SyncJumpWidth = CAN_SJW_1TQ;
  hcan3.Init.TimeSeg1 = CAN_BS1_8TQ;
  hcan3.Init.TimeSeg2 = CAN_BS2_1TQ;
  hcan3.Init.TimeTriggeredMode = DISABLE;
  hcan3.Init.AutoBusOff = DISABLE;
  hcan3.Init.AutoWakeUp = DISABLE;
  hcan3.Init.AutoRetransmission = DISABLE;
  hcan3.Init.ReceiveFifoLocked = DISABLE;
  hcan3.Init.TransmitFifoPriority = DISABLE;
  if (HAL_CAN_Init(&hcan3) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN CAN3_Init 2 */
  CAN_FilterTypeDef sFilterConfig;
  	sFilterConfig.FilterActivation = ENABLE;
  	sFilterConfig.FilterMode = CAN_FILTERMODE_IDMASK;
  	sFilterConfig.FilterScale = CAN_FILTERSCALE_16BIT;

  	sFilterConfig.FilterFIFOAssignment = CAN_FILTER_FIFO0;
  	sFilterConfig.FilterBank = 0;
  	sFilterConfig.FilterMaskIdHigh = 0x1F;
  	sFilterConfig.FilterMaskIdLow = 0xFF;
  	sFilterConfig.FilterIdHigh = CAN1_DV_SYSTEM_STATUS_FRAME_ID >> 8;
  	sFilterConfig.FilterIdLow = CAN1_DV_SYSTEM_STATUS_FRAME_ID;

  	if (HAL_CAN_ConfigFilter(&hcan3, &sFilterConfig) != HAL_OK) {
  		Error_Handler();
  	}

  	sFilterConfig.FilterFIFOAssignment = CAN_FILTER_FIFO1;
  	if (HAL_CAN_ConfigFilter(&hcan3, &sFilterConfig) != HAL_OK) {
  		Error_Handler();
  	}

  	sFilterConfig.FilterFIFOAssignment = CAN_FILTER_FIFO0;
  	sFilterConfig.FilterBank = 1;
  	sFilterConfig.FilterMaskIdHigh = 0x1F;
  	sFilterConfig.FilterMaskIdLow = 0xFF;
  	sFilterConfig.FilterIdHigh = CAN1_AMS_STATUS_1_FRAME_ID >> 8;
  	sFilterConfig.FilterIdLow = CAN1_AMS_STATUS_1_FRAME_ID;

  	if (HAL_CAN_ConfigFilter(&hcan3, &sFilterConfig) != HAL_OK) {
  		Error_Handler();
  	}

  	sFilterConfig.FilterFIFOAssignment = CAN_FILTER_FIFO1;
  	if (HAL_CAN_ConfigFilter(&hcan3, &sFilterConfig) != HAL_OK) {
  		Error_Handler();
  	}

  /* USER CODE END CAN3_Init 2 */

}

/**
  * @brief DSIHOST Initialization Function
  * @param None
  * @retval None
  */
static void MX_DSIHOST_DSI_Init(void)
{

  /* USER CODE BEGIN DSIHOST_Init 0 */

  /* USER CODE END DSIHOST_Init 0 */

  DSI_PLLInitTypeDef PLLInit = {0};
  DSI_HOST_TimeoutTypeDef HostTimeouts = {0};
  DSI_PHY_TimerTypeDef PhyTimings = {0};
  DSI_LPCmdTypeDef LPCmd = {0};
  DSI_CmdCfgTypeDef CmdCfg = {0};

  /* USER CODE BEGIN DSIHOST_Init 1 */

  /* USER CODE END DSIHOST_Init 1 */
  hdsi.Instance = DSI;
  hdsi.Init.AutomaticClockLaneControl = DSI_AUTO_CLK_LANE_CTRL_DISABLE;
  hdsi.Init.TXEscapeCkdiv = 4;
  hdsi.Init.NumberOfLanes = DSI_TWO_DATA_LANES;
  PLLInit.PLLNDIV = 20;
  PLLInit.PLLIDF = DSI_PLL_IN_DIV1;
  PLLInit.PLLODF = DSI_PLL_OUT_DIV1;
  if (HAL_DSI_Init(&hdsi, &PLLInit) != HAL_OK)
  {
    Error_Handler();
  }
  HostTimeouts.TimeoutCkdiv = 1;
  HostTimeouts.HighSpeedTransmissionTimeout = 0;
  HostTimeouts.LowPowerReceptionTimeout = 0;
  HostTimeouts.HighSpeedReadTimeout = 0;
  HostTimeouts.LowPowerReadTimeout = 0;
  HostTimeouts.HighSpeedWriteTimeout = 0;
  HostTimeouts.HighSpeedWritePrespMode = DSI_HS_PM_DISABLE;
  HostTimeouts.LowPowerWriteTimeout = 0;
  HostTimeouts.BTATimeout = 0;
  if (HAL_DSI_ConfigHostTimeouts(&hdsi, &HostTimeouts) != HAL_OK)
  {
    Error_Handler();
  }
  PhyTimings.ClockLaneHS2LPTime = 28;
  PhyTimings.ClockLaneLP2HSTime = 33;
  PhyTimings.DataLaneHS2LPTime = 15;
  PhyTimings.DataLaneLP2HSTime = 25;
  PhyTimings.DataLaneMaxReadTime = 0;
  PhyTimings.StopWaitTime = 10;
  if (HAL_DSI_ConfigPhyTimer(&hdsi, &PhyTimings) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_DSI_ConfigFlowControl(&hdsi, DSI_FLOW_CONTROL_BTA) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_DSI_SetLowPowerRXFilter(&hdsi, 10000) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_DSI_ConfigErrorMonitor(&hdsi, HAL_DSI_ERROR_NONE) != HAL_OK)
  {
    Error_Handler();
  }
  LPCmd.LPGenShortWriteNoP = DSI_LP_GSW0P_ENABLE;
  LPCmd.LPGenShortWriteOneP = DSI_LP_GSW1P_ENABLE;
  LPCmd.LPGenShortWriteTwoP = DSI_LP_GSW2P_ENABLE;
  LPCmd.LPGenShortReadNoP = DSI_LP_GSR0P_ENABLE;
  LPCmd.LPGenShortReadOneP = DSI_LP_GSR1P_ENABLE;
  LPCmd.LPGenShortReadTwoP = DSI_LP_GSR2P_ENABLE;
  LPCmd.LPGenLongWrite = DSI_LP_GLW_ENABLE;
  LPCmd.LPDcsShortWriteNoP = DSI_LP_DSW0P_ENABLE;
  LPCmd.LPDcsShortWriteOneP = DSI_LP_DSW1P_ENABLE;
  LPCmd.LPDcsShortReadNoP = DSI_LP_DSR0P_ENABLE;
  LPCmd.LPDcsLongWrite = DSI_LP_DLW_ENABLE;
  LPCmd.LPMaxReadPacket = DSI_LP_MRDP_ENABLE;
  LPCmd.AcknowledgeRequest = DSI_ACKNOWLEDGE_DISABLE;
  if (HAL_DSI_ConfigCommand(&hdsi, &LPCmd) != HAL_OK)
  {
    Error_Handler();
  }
  CmdCfg.VirtualChannelID = 0;
  CmdCfg.ColorCoding = DSI_RGB888;
  CmdCfg.CommandSize = 800;
  CmdCfg.TearingEffectSource = DSI_TE_DSILINK;
  CmdCfg.TearingEffectPolarity = DSI_TE_RISING_EDGE;
  CmdCfg.HSPolarity = DSI_HSYNC_ACTIVE_LOW;
  CmdCfg.VSPolarity = DSI_VSYNC_ACTIVE_LOW;
  CmdCfg.DEPolarity = DSI_DATA_ENABLE_ACTIVE_HIGH;
  CmdCfg.VSyncPol = DSI_VSYNC_FALLING;
  CmdCfg.AutomaticRefresh = DSI_AR_DISABLE;
  CmdCfg.TEAcknowledgeRequest = DSI_TE_ACKNOWLEDGE_DISABLE;
  if (HAL_DSI_ConfigAdaptedCommandMode(&hdsi, &CmdCfg) != HAL_OK)
  {
    Error_Handler();
  }
  if (HAL_DSI_SetGenericVCID(&hdsi, 0) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN DSIHOST_Init 2 */

  /* USER CODE END DSIHOST_Init 2 */

}

/**
  * @brief I2C2 Initialization Function
  * @param None
  * @retval None
  */
static void MX_I2C2_Init(void)
{

  /* USER CODE BEGIN I2C2_Init 0 */

  /* USER CODE END I2C2_Init 0 */

  /* USER CODE BEGIN I2C2_Init 1 */

  /* USER CODE END I2C2_Init 1 */
  hi2c2.Instance = I2C2;
  hi2c2.Init.Timing = 0x00C0EAFF;
  hi2c2.Init.OwnAddress1 = 0;
  hi2c2.Init.AddressingMode = I2C_ADDRESSINGMODE_7BIT;
  hi2c2.Init.DualAddressMode = I2C_DUALADDRESS_DISABLE;
  hi2c2.Init.OwnAddress2 = 0;
  hi2c2.Init.OwnAddress2Masks = I2C_OA2_NOMASK;
  hi2c2.Init.GeneralCallMode = I2C_GENERALCALL_DISABLE;
  hi2c2.Init.NoStretchMode = I2C_NOSTRETCH_DISABLE;
  if (HAL_I2C_Init(&hi2c2) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Analogue filter
  */
  if (HAL_I2CEx_ConfigAnalogFilter(&hi2c2, I2C_ANALOGFILTER_ENABLE) != HAL_OK)
  {
    Error_Handler();
  }

  /** Configure Digital filter
  */
  if (HAL_I2CEx_ConfigDigitalFilter(&hi2c2, 0) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN I2C2_Init 2 */

  /* USER CODE END I2C2_Init 2 */

}

/**
  * @brief LTDC Initialization Function
  * @param None
  * @retval None
  */
static void MX_LTDC_Init(void)
{

  /* USER CODE BEGIN LTDC_Init 0 */

  /* USER CODE END LTDC_Init 0 */

  LTDC_LayerCfgTypeDef pLayerCfg = {0};

  /* USER CODE BEGIN LTDC_Init 1 */

  /* USER CODE END LTDC_Init 1 */
  hltdc.Instance = LTDC;
  hltdc.Init.HSPolarity = LTDC_HSPOLARITY_AL;
  hltdc.Init.VSPolarity = LTDC_VSPOLARITY_AL;
  hltdc.Init.DEPolarity = LTDC_DEPOLARITY_AL;
  hltdc.Init.PCPolarity = LTDC_PCPOLARITY_IPC;
  hltdc.Init.HorizontalSync = 0;
  hltdc.Init.VerticalSync = 0;
  hltdc.Init.AccumulatedHBP = 1;
  hltdc.Init.AccumulatedVBP = 1;
  hltdc.Init.AccumulatedActiveW = 801;
  hltdc.Init.AccumulatedActiveH = 481;
  hltdc.Init.TotalWidth = 802;
  hltdc.Init.TotalHeigh = 482;
  hltdc.Init.Backcolor.Blue = 0;
  hltdc.Init.Backcolor.Green = 0;
  hltdc.Init.Backcolor.Red = 0;
  if (HAL_LTDC_Init(&hltdc) != HAL_OK)
  {
    Error_Handler();
  }
  pLayerCfg.WindowX0 = 0;
  pLayerCfg.WindowX1 = 800;
  pLayerCfg.WindowY0 = 0;
  pLayerCfg.WindowY1 = 50;
  pLayerCfg.PixelFormat = LTDC_PIXEL_FORMAT_ARGB8888;
  pLayerCfg.Alpha = 255;
  pLayerCfg.Alpha0 = 0;
  pLayerCfg.BlendingFactor1 = LTDC_BLENDING_FACTOR1_CA;
  pLayerCfg.BlendingFactor2 = LTDC_BLENDING_FACTOR2_CA;
  pLayerCfg.FBStartAdress = 0;
  pLayerCfg.ImageWidth = 800;
  pLayerCfg.ImageHeight = 480;
  pLayerCfg.Backcolor.Blue = 0;
  pLayerCfg.Backcolor.Green = 0;
  pLayerCfg.Backcolor.Red = 0;
  if (HAL_LTDC_ConfigLayer(&hltdc, &pLayerCfg, 0) != HAL_OK)
  {
    Error_Handler();
  }
  /* USER CODE BEGIN LTDC_Init 2 */

  /* USER CODE END LTDC_Init 2 */

}

/**
  * @brief GPIO Initialization Function
  * @param None
  * @retval None
  */
static void MX_GPIO_Init(void)
{
  GPIO_InitTypeDef GPIO_InitStruct = {0};
/* USER CODE BEGIN MX_GPIO_Init_1 */
/* USER CODE END MX_GPIO_Init_1 */

  /* GPIO Ports Clock Enable */
  __HAL_RCC_GPIOH_CLK_ENABLE();
  __HAL_RCC_GPIOA_CLK_ENABLE();
  __HAL_RCC_GPIOC_CLK_ENABLE();
  __HAL_RCC_GPIOB_CLK_ENABLE();
  __HAL_RCC_GPIOE_CLK_ENABLE();
  __HAL_RCC_GPIOI_CLK_ENABLE();

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOH, EBS_ERROR_Pin|IMD_ERROR_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOA, AMS_ERROR_Pin|SC_OPEN_Pin|TS_OFF_Pin|AMI7_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(ACTIVATE_TS_LED_GPIO_Port, ACTIVATE_TS_LED_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOB, R2D_LED_Pin|DSI_RESET_Pin|AMI6_Pin|AMI5_Pin
                          |AMI4_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pin Output Level */
  HAL_GPIO_WritePin(GPIOI, AMI2_Pin|AMI1_Pin, GPIO_PIN_RESET);

  /*Configure GPIO pins : EBS_ERROR_Pin IMD_ERROR_Pin */
  GPIO_InitStruct.Pin = EBS_ERROR_Pin|IMD_ERROR_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOH, &GPIO_InitStruct);

  /*Configure GPIO pins : AMS_ERROR_Pin SC_OPEN_Pin TS_OFF_Pin AMI7_Pin */
  GPIO_InitStruct.Pin = AMS_ERROR_Pin|SC_OPEN_Pin|TS_OFF_Pin|AMI7_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOA, &GPIO_InitStruct);

  /*Configure GPIO pin : ACTIVATE_TS_Pin */
  GPIO_InitStruct.Pin = ACTIVATE_TS_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(ACTIVATE_TS_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : ACTIVATE_TS_LED_Pin */
  GPIO_InitStruct.Pin = ACTIVATE_TS_LED_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(ACTIVATE_TS_LED_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : R2D_Pin */
  GPIO_InitStruct.Pin = R2D_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_INPUT;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(R2D_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : R2D_LED_Pin AMI6_Pin AMI5_Pin AMI4_Pin */
  GPIO_InitStruct.Pin = R2D_LED_Pin|AMI6_Pin|AMI5_Pin|AMI4_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOB, &GPIO_InitStruct);

  /*Configure GPIO pin : LCD_INT_Pin */
  GPIO_InitStruct.Pin = LCD_INT_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_IT_RISING;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  HAL_GPIO_Init(LCD_INT_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : DSI_RESET_Pin */
  GPIO_InitStruct.Pin = DSI_RESET_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_HIGH;
  HAL_GPIO_Init(DSI_RESET_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pin : AMI3_Pin */
  GPIO_InitStruct.Pin = AMI3_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(AMI3_GPIO_Port, &GPIO_InitStruct);

  /*Configure GPIO pins : AMI2_Pin AMI1_Pin */
  GPIO_InitStruct.Pin = AMI2_Pin|AMI1_Pin;
  GPIO_InitStruct.Mode = GPIO_MODE_OUTPUT_PP;
  GPIO_InitStruct.Pull = GPIO_NOPULL;
  GPIO_InitStruct.Speed = GPIO_SPEED_FREQ_LOW;
  HAL_GPIO_Init(GPIOI, &GPIO_InitStruct);

/* USER CODE BEGIN MX_GPIO_Init_2 */
/* USER CODE END MX_GPIO_Init_2 */
}

/* USER CODE BEGIN 4 */
void HAL_CAN_RxFifo0MsgPendingCallback(CAN_HandleTypeDef *hcan){
	if(hcan == &hcan3){
		osThreadFlagsSet(canRXHandle, canRxFifo0MsgPending);
	}
}
void HAL_CAN_RxFifo1MsgPendingCallback(CAN_HandleTypeDef *hcan){
	if(hcan == &hcan3){
			osThreadFlagsSet(canRXHandle, canRxFifo1MsgPending);
		}
}
/**
 * @brief Resets uC on display daughterboard
 * @param None
 * @retval None
 */
void LCD_Reset(void) {
	/* Activate XRES active low */
	HAL_GPIO_WritePin(DSI_RESET_GPIO_Port, DSI_RESET_Pin, GPIO_PIN_RESET);

	HAL_Delay(20); /* wait 20 ms */

	/* Desactivate XRES */
	HAL_GPIO_WritePin(DSI_RESET_GPIO_Port, DSI_RESET_Pin, GPIO_PIN_SET);

	/* Wait for 10ms after releasing XRES before sending commands */
	HAL_Delay(10);
}

/******************************** LINK OTM8009A (Display) ***********************/
void OTM8009A_IO_Delay(uint32_t Delay) {
	HAL_Delay(Delay);
}

void DSI_IO_WriteCmd(uint32_t NbrParams, uint8_t *pParams) {
	if (NbrParams <= 1) {
		HAL_DSI_ShortWrite(&hdsi, 0, DSI_DCS_SHORT_PKT_WRITE_P1, pParams[0],
				pParams[1]);
	} else {
		HAL_DSI_LongWrite(&hdsi, 0, DSI_DCS_LONG_PKT_WRITE, NbrParams,
				pParams[NbrParams], pParams);
	}
}

/******************************** LINK TS (TouchScreen) ***********************/

/**
 * @brief  Initializes Touchscreen low level.
 * @retval None
 */
void TS_IO_Init(void) {
	MX_I2C2_Init();
}

/**
 * @brief  Reads a single data.
 * @param  Addr: I2C address
 * @param  Reg: Reg address
 * @retval Data to be read
 */
uint8_t TS_IO_Read(uint8_t Addr, uint8_t Reg) {
	uint8_t read_value = 0;

	I2Cx_ReadMultiple(&hi2c2, Addr, Reg, I2C_MEMADD_SIZE_8BIT,
			(uint8_t*) &read_value, 1);

	return read_value;
}

/**
 * @brief  Reads multiple data with I2C communication
 *         channel from TouchScreen.
 * @param  Addr: I2C address
 * @param  Reg: Register address
 * @param  Buffer: Pointer to data buffer
 * @param  Length: Length of the data
 * @retval Number of read data
 */
uint16_t TS_IO_ReadMultiple(uint8_t Addr, uint8_t Reg, uint8_t *Buffer,
		uint16_t Length) {
	return I2Cx_ReadMultiple(&hi2c2, Addr, (uint16_t) Reg,
	I2C_MEMADD_SIZE_8BIT, Buffer, Length);
}

/**
 * @brief  Writes a single data.
 * @param  Addr: I2C address
 * @param  Reg: Reg address
 * @param  Value: Data to be written
 * @retval None
 */
void TS_IO_Write(uint8_t Addr, uint8_t Reg, uint8_t Value) {
	I2Cx_WriteMultiple(&hi2c2, Addr, (uint16_t) Reg, I2C_MEMADD_SIZE_8BIT,
			(uint8_t*) &Value, 1);
}

/**
 * @brief  Writes multiple data with I2C communication
 *         channel from MCU to TouchScreen.
 * @param  Addr: I2C address
 * @param  Reg: Register address
 * @param  Buffer: Pointer to data buffer
 * @param  Length: Length of the data
 * @retval None
 */
void TS_IO_WriteMultiple(uint8_t Addr, uint8_t Reg, uint8_t *Buffer,
		uint16_t Length) {
	I2Cx_WriteMultiple(&hi2c2, Addr, (uint16_t) Reg, I2C_MEMADD_SIZE_8BIT,
			Buffer, Length);
}

/**
 * @brief  Delay function used in TouchScreen low level driver.
 * @param  Delay: Delay in ms
 * @retval None
 */
void TS_IO_Delay(uint32_t Delay) {
	HAL_Delay(Delay);
}

/******************************** I2C Helper functions ***********************/
/**
 * @brief  Reads multiple data.
 * @param  i2c_handler : I2C handler
 * @param  Addr: I2C address
 * @param  Reg: Reg address
 * @param  MemAddress: memory address
 * @param  Buffer: Pointer to data buffer
 * @param  Length: Length of the data
 * @retval HAL status
 */
static HAL_StatusTypeDef I2Cx_ReadMultiple(I2C_HandleTypeDef *i2c_handler,
		uint8_t Addr, uint16_t Reg, uint16_t MemAddress, uint8_t *Buffer,
		uint16_t Length) {
	HAL_StatusTypeDef status = HAL_OK;

	status = HAL_I2C_Mem_Read(i2c_handler, Addr, (uint16_t) Reg, MemAddress,
			Buffer, Length, 1000);

	/* Check the communication status */
	if (status != HAL_OK) {
		/* I2C error occured */
		I2Cx_Error(i2c_handler, Addr);
	}
	return status;
}

/**
 * @brief  Writes a value in a register of the device through BUS in using DMA mode.
 * @param  i2c_handler : I2C handler
 * @param  Addr: Device address on BUS Bus.
 * @param  Reg: The target register address to write
 * @param  MemAddress: memory address
 * @param  Buffer: The target register value to be written
 * @param  Length: buffer size to be written
 * @retval HAL status
 */
static HAL_StatusTypeDef I2Cx_WriteMultiple(I2C_HandleTypeDef *i2c_handler,
		uint8_t Addr, uint16_t Reg, uint16_t MemAddress, uint8_t *Buffer,
		uint16_t Length) {
	HAL_StatusTypeDef status = HAL_OK;

	status = HAL_I2C_Mem_Write(i2c_handler, Addr, (uint16_t) Reg, MemAddress,
			Buffer, Length, 1000);

	/* Check the communication status */
	if (status != HAL_OK) {
		/* Re-Initiaize the I2C Bus */
		I2Cx_Error(i2c_handler, Addr);
	}
	return status;
}

/**
 * @brief  Manages error callback by re-initializing I2C.
 * @param  i2c_handler : I2C handler
 * @param  Addr: I2C Address
 * @retval None
 */
static void I2Cx_Error(I2C_HandleTypeDef *i2c_handler, uint8_t Addr) {
	/* De-initialize the I2C communication bus */
	HAL_I2C_DeInit(i2c_handler);

	/* Re-Initialize the I2C communication bus */
	MX_I2C2_Init();
}
/* USER CODE END 4 */

/* USER CODE BEGIN Header_StartDefaultTask */
/**
  * @brief  Function implementing the defaultTask thread.
  * @param  argument: Not used
  * @retval None
  */
/* USER CODE END Header_StartDefaultTask */
void StartDefaultTask(void *argument)
{
  /* USER CODE BEGIN 5 */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END 5 */
}

/* USER CODE BEGIN Header_lvglTask */
/**
* @brief Function implementing the lvgl thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_lvglTask */
__weak void lvglTask(void *argument)
{
  /* USER CODE BEGIN lvglTask */
  /* Infinite loop */
  for(;;)
  {
    osDelay(10);
  }
  /* USER CODE END lvglTask */
}

/* USER CODE BEGIN Header_indicatorsTask */
/**
* @brief Function implementing the indicators thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_indicatorsTask */
__weak void indicatorsTask(void *argument)
{
  /* USER CODE BEGIN indicatorsTask */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END indicatorsTask */
}

/* USER CODE BEGIN Header_canRXTask */
/**
* @brief Function implementing the canRX thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_canRXTask */
__weak void canRXTask(void *argument)
{
  /* USER CODE BEGIN canRXTask */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END canRXTask */
}

/* USER CODE BEGIN Header_canTXTask */
/**
* @brief Function implementing the canTX thread.
* @param argument: Not used
* @retval None
*/
/* USER CODE END Header_canTXTask */
__weak void canTXTask(void *argument)
{
  /* USER CODE BEGIN canTXTask */
  /* Infinite loop */
  for(;;)
  {
    osDelay(1);
  }
  /* USER CODE END canTXTask */
}

/**
  * @brief  This function is executed in case of error occurrence.
  * @retval None
  */
void Error_Handler(void)
{
  /* USER CODE BEGIN Error_Handler_Debug */
  /* User can add his own implementation to report the HAL error return state */
  __disable_irq();
  while (1)
  {
  }
  /* USER CODE END Error_Handler_Debug */
}

#ifdef  USE_FULL_ASSERT
/**
  * @brief  Reports the name of the source file and the source line number
  *         where the assert_param error has occurred.
  * @param  file: pointer to the source file name
  * @param  line: assert_param error line source number
  * @retval None
  */
void assert_failed(uint8_t *file, uint32_t line)
{
  /* USER CODE BEGIN 6 */
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */
  /* USER CODE END 6 */
}
#endif /* USE_FULL_ASSERT */
