/*
 * tasks.c
 *
 *  Created on: Feb 18, 2023
 *      Author: tore
 */
#include "main.h"
#include "cmsis_os.h"
#include "can1.h"
#include "lvgl.h"

void lvglTask(void *argument);
void indicatorsTask(void *argument);
void canRXTask(void *argument);
void canTXTask(void *argument);

extern CAN_HandleTypeDef hcan3;
extern osMessageQueueId_t indicatorsQueueHandle;
extern osMutexId_t lvgl_mutexHandle;

uint32_t counter = 0;
enum errors{
	AMS_ERROR = 1,
	IMD_ERROR,
	EBS_ERROR,
	SC_OPEN
};

extern const uint8_t canRxFifo0MsgPending;
extern const uint8_t canRxFifo1MsgPending;

void indicatorsTask(void *argument){
	static indicators_t indicators;
	for(;;){

		if(osMessageQueueGet(indicatorsQueueHandle, &indicators, 0, 500) == osOK){
			HAL_GPIO_WritePin(AMS_ERROR_GPIO_Port, AMS_ERROR_Pin, (indicators.errors & (1 << AMS_ERROR)));
			HAL_GPIO_WritePin(IMD_ERROR_GPIO_Port, IMD_ERROR_Pin, (indicators.errors & (1 << IMD_ERROR)));
			//HAL_GPIO_WritePin(EBS_ERROR_GPIO_Port, EBS_ERROR_Pin, (indicators.errors & (1 << EBS_ERROR)));
			HAL_GPIO_WritePin(SC_OPEN_GPIO_Port, SC_OPEN_Pin, (indicators.errors & (1 << SC_OPEN)));
			HAL_GPIO_TogglePin(TS_OFF_GPIO_Port, TS_OFF_Pin);
			HAL_GPIO_WritePin(TS_OFF_GPIO_Port, TS_OFF_Pin, (indicators.ts_off));
			if(indicators.activate_ts == 1){
				HAL_GPIO_WritePin(ACTIVATE_TS_LED_GPIO_Port, ACTIVATE_TS_LED_Pin, GPIO_PIN_SET);
			}else HAL_GPIO_WritePin(ACTIVATE_TS_LED_GPIO_Port, ACTIVATE_TS_LED_Pin, GPIO_PIN_RESET);

			if(indicators.ready_to_drive == 1){
				HAL_GPIO_WritePin(R2D_LED_GPIO_Port, R2D_LED_Pin, GPIO_PIN_SET);
			}else HAL_GPIO_WritePin(R2D_LED_GPIO_Port, R2D_LED_Pin, GPIO_PIN_RESET);


			switch(indicators.ami){
						case 0:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_RESET);
							break;
						case 1:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_RESET);
							break;
						case 2:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_RESET);
							break;
						case 3:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_RESET);
							break;
						case 4:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_RESET);
							break;
						case 5:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_RESET);
							break;
						case 6:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_RESET);
							break;
						case 7:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_RESET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_SET);
							break;
						default:
							HAL_GPIO_WritePin(AMI1_GPIO_Port, AMI1_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI2_GPIO_Port, AMI2_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI3_GPIO_Port, AMI3_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI4_GPIO_Port, AMI4_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI5_GPIO_Port, AMI5_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI6_GPIO_Port, AMI6_Pin, GPIO_PIN_SET);
							HAL_GPIO_WritePin(AMI7_GPIO_Port, AMI7_Pin, GPIO_PIN_SET);
							break;
						}

		}
		else{
			// No new TS state recieved, turn of indicator
			HAL_GPIO_WritePin(TS_OFF_GPIO_Port, TS_OFF_Pin, GPIO_PIN_RESET);
		}

		counter +=1;
		if (counter >= 150){
			HAL_GPIO_WritePin(AMS_ERROR_GPIO_Port, AMS_ERROR_Pin, 1);
			HAL_GPIO_WritePin(IMD_ERROR_GPIO_Port, IMD_ERROR_Pin, 1);

		}
	}
}

void canTXTask(void *argument){
	const CAN_TxHeaderTypeDef header_status_1 = {
			.StdId = CAN1_DBU_STATUS_1_FRAME_ID,
			.IDE = CAN1_DBU_STATUS_1_IS_EXTENDED,
			.DLC = CAN1_DBU_STATUS_1_LENGTH
	};
	const CAN_TxHeaderTypeDef header_status_2 = {
			.StdId = CAN1_DBU_STATUS_2_FRAME_ID,
			.IDE = CAN1_DBU_STATUS_2_IS_EXTENDED,
			.DLC = CAN1_DBU_STATUS_2_LENGTH
	};
	uint8_t data[8];
	uint32_t mailbox;

	struct can1_dbu_status_1_t data_status_1;
	struct can1_dbu_status_2_t data_status_2;

	for(;;){
		data_status_1.activate_ts_button = ~HAL_GPIO_ReadPin(ACTIVATE_TS_GPIO_Port, ACTIVATE_TS_Pin);
		data_status_1.ready_to_drive_button = ~HAL_GPIO_ReadPin(R2D_GPIO_Port, R2D_Pin);
		data_status_1.selected_mission = 0; //TODO: Read from Q

		can1_dbu_status_1_pack(data, &data_status_1, CAN1_DBU_STATUS_1_LENGTH);
		if(HAL_CAN_AddTxMessage(&hcan3, &header_status_1, data, &mailbox) != HAL_OK){
			Error_Handler();
		}


		data_status_2.screen_id = 0;
		can1_dbu_status_2_pack(data, &data_status_2, CAN1_DBU_STATUS_2_LENGTH);
		if(HAL_CAN_AddTxMessage(&hcan3, &header_status_2, data, &mailbox) != HAL_OK){
					Error_Handler();
		}

		osDelay(100);
	}
}

void canRXTask(void *argument){
	static CAN_RxHeaderTypeDef header;
	static uint8_t data[8];

	static struct can1_ecu_status_t ecu_status;
	static struct can1_dv_system_status_t dv_system_status;
	static struct can1_ams_status_1_t ams_status;

	static indicators_t indicators;

	osStatus_t status;

	for(;;){
		//osThreadFlagsWait(canRxFifo0MsgPending | canRxFifo1MsgPending, osFlagsWaitAny, osWaitForever);

		while(HAL_CAN_GetRxFifoFillLevel(&hcan3, CAN_RX_FIFO0) != 0){
			HAL_CAN_GetRxMessage(&hcan3, CAN_RX_FIFO0, &header, data);
			switch(header.StdId){
			case CAN1_AMS_STATUS_1_FRAME_ID:
				counter = 0;
				can1_ams_status_1_unpack(&ams_status, data, CAN1_AMS_STATUS_1_LENGTH);
			break;

			case CAN1_ECU_STATUS_FRAME_ID:
				can1_ecu_status_unpack(&ecu_status, data, CAN1_ECU_STATUS_LENGTH);
			break;

			case CAN1_DV_SYSTEM_STATUS_FRAME_ID:
				can1_dv_system_status_unpack(&dv_system_status, data, CAN1_DV_SYSTEM_STATUS_LENGTH);
			break;

			}
		}

		while(HAL_CAN_GetRxFifoFillLevel(&hcan3, CAN_RX_FIFO1) != 0){
			HAL_CAN_GetRxMessage(&hcan3, CAN_RX_FIFO1, &header, data);
						switch(header.StdId){
						case CAN1_AMS_STATUS_1_FRAME_ID:
							counter = 0;
							can1_ams_status_1_unpack(&ams_status, data, CAN1_AMS_STATUS_1_LENGTH);
						break;

						case CAN1_ECU_STATUS_FRAME_ID:
							can1_ecu_status_unpack(&ecu_status, data, CAN1_ECU_STATUS_LENGTH);
						break;

						case CAN1_DV_SYSTEM_STATUS_FRAME_ID:
							can1_dv_system_status_unpack(&dv_system_status, data, CAN1_DV_SYSTEM_STATUS_LENGTH);
						break;

						}
		}
		//osThreadFlagsClear(canRxFifo0MsgPending | canRxFifo1MsgPending);

		indicators.ami = dv_system_status.ami_state;
		indicators.errors = (ams_status.ams_error << AMS_ERROR) | (ams_status.imd_error << IMD_ERROR) | (0 << EBS_ERROR) | ((ams_status.sc_closed ^ 0x01) << SC_OPEN);
		indicators.ts_off = ecu_status.ts_off;

		status = osMessageQueueReset(indicatorsQueueHandle);
		if(status != osOK){
			//Error_Handler();
		}
		status = osMessageQueuePut(indicatorsQueueHandle, &indicators, 0, 100);
		if(status != osOK){
			//Error_Handler();
		}
		osDelay(10);
		}
}

void lvglTask(void *argument)
{
  /* USER CODE BEGIN lvglTask */
  /* Infinite loop */
  for(;;)
  {
	if(osMutexAcquire(lvgl_mutexHandle, 10) == osOK){
		lv_task_handler();
		osMutexRelease(lvgl_mutexHandle);
	}
    osDelay(10);
  }
  /* USER CODE END lvglTask */
}


