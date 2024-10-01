/* USER CODE BEGIN Header */
/**
 ******************************************************************************
 * @file           : main.c
 * @brief          : Main program body
 ******************************************************************************
 * @attention
 *
 * Copyright (c) 2022 STMicroelectronics.
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
#include "adc.h"
#include "can.h"
#include "dma.h"
#include "tim.h"
#include "gpio.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */
#include "kthfspe_can.h"
/* USER CODE END Includes */

/* Private typedef -----------------------------------------------------------*/
/* USER CODE BEGIN PTD */

/* USER CODE END PTD */

/* Private define ------------------------------------------------------------*/
/* USER CODE BEGIN PD */
/* USER CODE END PD */

/* Private macro -------------------------------------------------------------*/
/* USER CODE BEGIN PM */

/* USER CODE END PM */

/* Private variables ---------------------------------------------------------*/

/* USER CODE BEGIN PV */

/* USER CODE END PV */

/* Private function prototypes -----------------------------------------------*/
void SystemClock_Config(void);
/* USER CODE BEGIN PFP */

/* USER CODE END PFP */

/* Private user code ---------------------------------------------------------*/
/* USER CODE BEGIN 0 */

struct {
	float rear_temp, front_temp, extra_temp, discharge_resistor_temp,
			inverter_temp;
} tData;

float pwm_vector[6];

float *ptData = &tData.rear_temp;

#define ADC_ROWS 5
#define ADC_COLS 10

uint16_t data_buffer[ADC_ROWS * ADC_COLS];

typedef enum {
	NONE = 0,
	FAN_1 = 1,
	FAN_2 = 2,
	FAN_3 = 3,
	FRONT_PUMP = 4,
	REAR_PUMP = 5,
	INVERTER_PUMP = 6
} cID;

void can1_ccu_status_1_transmit_callback(can1_ccu_status_1_t *ccu_status_1) {
	ccu_status_1->fan1_temperature = tData.front_temp;
	ccu_status_1->fan2_temperature = tData.rear_temp;
	ccu_status_1->fan3_temperature = tData.inverter_temp;
	ccu_status_1->fron_pump_temperature = tData.front_temp;
	ccu_status_1->rear_pump_temperature = tData.rear_temp;
	ccu_status_1->inverter_pump_temperature = tData.inverter_temp;
	return;
}

void can1_ccu_status_2_transmit_callback(can1_ccu_status_2_t *can1_ccu_status_2) {
	return;
}

void set_duty_cycle(cID id, float duty_cycle) {
	if (duty_cycle < 0)
		duty_cycle = 0;
	if (100 < duty_cycle)
		duty_cycle = 100;

	switch (id) {
	case FAN_1:
		htim3.Instance->CCR1 = htim3.Instance->ARR * duty_cycle / 100;
		break;
	case FAN_2:
		htim15.Instance->CCR2 = htim15.Instance->ARR * duty_cycle / 100;
		break;
	case FAN_3:
		htim15.Instance->CCR1 = htim15.Instance->ARR * duty_cycle / 100;
		break;
	case FRONT_PUMP:
		htim3.Instance->CCR2 = htim3.Instance->ARR * duty_cycle / 100;
		break;
	case REAR_PUMP:
		htim3.Instance->CCR3 = htim3.Instance->ARR * duty_cycle / 100;
		break;
	case INVERTER_PUMP:
		htim3.Instance->CCR4 = htim3.Instance->ARR * duty_cycle / 100;
		break;

	}
	//htim3.Instance->CCR1 = 30;
	//htim15.Instance->CCR2 = 30;
	//htim15.Instance->CCR1 = 30;
}

void can1_mcu_set_ccu_cooling_points_receive_callback(
		can1_mcu_set_ccu_cooling_points_t *mcu_set_ccu_cooling_points) {
	set_duty_cycle(FAN_1, mcu_set_ccu_cooling_points->fan1_speed);
	set_duty_cycle(FAN_2, mcu_set_ccu_cooling_points->fan2_speed);
	set_duty_cycle(FAN_3, mcu_set_ccu_cooling_points->fan3_speed);
	set_duty_cycle(FRONT_PUMP, mcu_set_ccu_cooling_points->fron_pump_speed);
	set_duty_cycle(REAR_PUMP, mcu_set_ccu_cooling_points->rear_pump_speed);
	set_duty_cycle(INVERTER_PUMP, mcu_set_ccu_cooling_points->inverter_pump_speed);
	return;
}

float temperature_from_thermistor(uint16_t bits) {

#define THERMISTOR_NOMINAL_RESISTANCE 	10000.0
#define THERMISTOR_SERIES_RESISTANCE 	10000.0
#define THERMISTOR_NOMINAL_TEMPERATURE 	25.0
#define THERMISTOR_BETA_VALUE 			3500.0
#define ADC_MAX_VALUE 					4095.0

	return (1
			/ ((log(
					((THERMISTOR_SERIES_RESISTANCE * (ADC_MAX_VALUE - bits))
							/ bits) / THERMISTOR_NOMINAL_RESISTANCE)
					/ THERMISTOR_BETA_VALUE)
					+ (1 / (273.15 + THERMISTOR_NOMINAL_TEMPERATURE)))) - 273.15;
}

int flag = 1;

void HAL_ADC_ConvCpltCallback(ADC_HandleTypeDef *hadc) {
	flag = 1;
}

void set_sample_frequency(double frequency) {
	frequency *= ADC_ROWS;
	double k = sqrt(SystemCoreClock / frequency);
	htim2.Instance->ARR = k;
	htim2.Instance->PSC = k;
	htim2.Instance->CNT = 0;
}

void set_cooling_frequency(double frequency) {
	double k = sqrt(SystemCoreClock / frequency);
	htim3.Instance->ARR = k;
	htim3.Instance->PSC = k;
	htim3.Instance->CNT = 0;
	htim15.Instance->ARR = k;
	htim15.Instance->PSC = k;
	htim15.Instance->CNT = 0;
}

void initialize_timers() {

	/* Initialize ADC sampler */

	set_sample_frequency(2000);

	if (HAL_TIM_Base_Start(&htim2) != HAL_OK) {
		Error_Handler();
	}

	/* Initialize PWM peripherals */

	set_cooling_frequency(20000);

	if (HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_1) != HAL_OK) {
		Error_Handler();
	}

	if (HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_2) != HAL_OK) {
		Error_Handler();
	}

	if (HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_3) != HAL_OK) {
		Error_Handler();
	}

	if (HAL_TIM_PWM_Start(&htim3, TIM_CHANNEL_4) != HAL_OK) {
		Error_Handler();
	}

	if (HAL_TIM_PWM_Start(&htim15, TIM_CHANNEL_1) != HAL_OK) {
		Error_Handler();
	}

	if (HAL_TIM_PWM_Start(&htim15, TIM_CHANNEL_2) != HAL_OK) {
		Error_Handler();
	}
}

/* USER CODE END 0 */

/**
 * @brief  The application entry point.
 * @retval int
 */
int main(void) {
	/* USER CODE BEGIN 1 */

	/* USER CODE END 1 */

	/* MCU Configuration--------------------------------------------------------*/

	/* Reset of all peripherals, Initializes the Flash interface and the Systick. */
	HAL_Init();

	/* USER CODE BEGIN Init */
	/* USER CODE END Init */

	/* Configure the system clock */
	SystemClock_Config();

	/* USER CODE BEGIN SysInit */

	/* USER CODE END SysInit */

	/* Initialize all configured peripherals */
	MX_GPIO_Init();
	MX_ADC_Init();
	MX_CAN_Init();
	MX_TIM2_Init();
	MX_TIM3_Init();
	MX_TIM15_Init();
	MX_DMA_Init();
	MX_TIM1_Init();
	MX_TIM7_Init();
	/* USER CODE BEGIN 2 */

	if (!init_peripheral_can_hal_can1(&hcan)) {
		Error_Handler();
	}

	initialize_timers();

	/* USER CODE END 2 */

	/* Infinite loop */
	/* USER CODE BEGIN WHILE */
	int i, j;
	while (1) {
		if (flag) {
			flag = 0;

			if (HAL_ADC_Start_DMA(&hadc, (uint32_t*) data_buffer,
					sizeof(data_buffer) / 2) != HAL_OK) { // Start ADC in DMA mode and declare the buffer where store the results
				Error_Handler();
			}

			for (i = 0; i < ADC_ROWS; i++) {
				ptData[i] = 0;
				for (j = 0; j < ADC_COLS; j++) {
					ptData[i] += data_buffer[ADC_ROWS * j + i];
				}
				ptData[i] = temperature_from_thermistor(ptData[i] / ADC_COLS);
			}
		}

		HAL_Delay(100);
		HAL_GPIO_TogglePin(LED_HRBT_GPIO_Port, LED_HRBT_Pin);
		HAL_GPIO_TogglePin(LED_ERR_GPIO_Port, LED_ERR_Pin);
		HAL_GPIO_TogglePin(LED_WRNG_GPIO_Port, LED_WRNG_Pin);
		can1_ccu_status_1_transmit();
		can1_ccu_status_2_transmit();

		/* USER CODE END WHILE */

		/* USER CODE BEGIN 3 */
	}
	/* USER CODE END 3 */
}

/**
 * @brief System Clock Configuration
 * @retval None
 */
void SystemClock_Config(void) {
	RCC_OscInitTypeDef RCC_OscInitStruct = { 0 };
	RCC_ClkInitTypeDef RCC_ClkInitStruct = { 0 };

	/** Initializes the RCC Oscillators according to the specified parameters
	 * in the RCC_OscInitTypeDef structure.
	 */
	RCC_OscInitStruct.OscillatorType = RCC_OSCILLATORTYPE_HSI
			| RCC_OSCILLATORTYPE_HSI14;
	RCC_OscInitStruct.HSIState = RCC_HSI_ON;
	RCC_OscInitStruct.HSI14State = RCC_HSI14_ON;
	RCC_OscInitStruct.HSICalibrationValue = RCC_HSICALIBRATION_DEFAULT;
	RCC_OscInitStruct.HSI14CalibrationValue = 16;
	RCC_OscInitStruct.PLL.PLLState = RCC_PLL_NONE;
	if (HAL_RCC_OscConfig(&RCC_OscInitStruct) != HAL_OK) {
		Error_Handler();
	}
	/** Initializes the CPU, AHB and APB buses clocks
	 */
	RCC_ClkInitStruct.ClockType = RCC_CLOCKTYPE_HCLK | RCC_CLOCKTYPE_SYSCLK
			| RCC_CLOCKTYPE_PCLK1;
	RCC_ClkInitStruct.SYSCLKSource = RCC_SYSCLKSOURCE_HSI;
	RCC_ClkInitStruct.AHBCLKDivider = RCC_SYSCLK_DIV1;
	RCC_ClkInitStruct.APB1CLKDivider = RCC_HCLK_DIV1;

	if (HAL_RCC_ClockConfig(&RCC_ClkInitStruct, FLASH_LATENCY_0) != HAL_OK) {
		Error_Handler();
	}
}

/* USER CODE BEGIN 4 */

/* USER CODE END 4 */

/**
 * @brief  This function is executed in case of error occurrence.
 * @retval None
 */
void Error_Handler(void) {
	/* USER CODE BEGIN Error_Handler_Debug */
	/* User can add his own implementation to report the HAL error return state */
	__disable_irq();
	while (1) {
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

