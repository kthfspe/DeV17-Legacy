/* USER CODE BEGIN Header */
/**
  ******************************************************************************
  * @file           : main.h
  * @brief          : Header for main.c file.
  *                   This file contains the common defines of the application.
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

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H

#ifdef __cplusplus
extern "C" {
#endif

/* Includes ------------------------------------------------------------------*/
#include "stm32f7xx_hal.h"

/* Private includes ----------------------------------------------------------*/
/* USER CODE BEGIN Includes */

/* USER CODE END Includes */

/* Exported types ------------------------------------------------------------*/
/* USER CODE BEGIN ET */
typedef struct{
	uint8_t ami;
	uint8_t errors;
	uint8_t ts_off;
	uint8_t activate_ts;
	uint8_t ready_to_drive;
}indicators_t;
/* USER CODE END ET */

/* Exported constants --------------------------------------------------------*/
/* USER CODE BEGIN EC */

/* USER CODE END EC */

/* Exported macro ------------------------------------------------------------*/
/* USER CODE BEGIN EM */

/* USER CODE END EM */

/* Exported functions prototypes ---------------------------------------------*/
void Error_Handler(void);

/* USER CODE BEGIN EFP */

/* USER CODE END EFP */

/* Private defines -----------------------------------------------------------*/
#define EBS_ERROR_Pin GPIO_PIN_2
#define EBS_ERROR_GPIO_Port GPIOH
#define IMD_ERROR_Pin GPIO_PIN_3
#define IMD_ERROR_GPIO_Port GPIOH
#define AMS_ERROR_Pin GPIO_PIN_4
#define AMS_ERROR_GPIO_Port GPIOA
#define SC_OPEN_Pin GPIO_PIN_5
#define SC_OPEN_GPIO_Port GPIOA
#define TS_OFF_Pin GPIO_PIN_6
#define TS_OFF_GPIO_Port GPIOA
#define AMI7_Pin GPIO_PIN_7
#define AMI7_GPIO_Port GPIOA
#define ACTIVATE_TS_Pin GPIO_PIN_4
#define ACTIVATE_TS_GPIO_Port GPIOC
#define ACTIVATE_TS_LED_Pin GPIO_PIN_5
#define ACTIVATE_TS_LED_GPIO_Port GPIOC
#define R2D_Pin GPIO_PIN_0
#define R2D_GPIO_Port GPIOB
#define R2D_LED_Pin GPIO_PIN_1
#define R2D_LED_GPIO_Port GPIOB
#define LCD_INT_Pin GPIO_PIN_12
#define LCD_INT_GPIO_Port GPIOE
#define DSI_RESET_Pin GPIO_PIN_12
#define DSI_RESET_GPIO_Port GPIOB
#define AMI6_Pin GPIO_PIN_7
#define AMI6_GPIO_Port GPIOB
#define AMI5_Pin GPIO_PIN_8
#define AMI5_GPIO_Port GPIOB
#define AMI4_Pin GPIO_PIN_9
#define AMI4_GPIO_Port GPIOB
#define AMI3_Pin GPIO_PIN_0
#define AMI3_GPIO_Port GPIOE
#define AMI2_Pin GPIO_PIN_6
#define AMI2_GPIO_Port GPIOI
#define AMI1_Pin GPIO_PIN_7
#define AMI1_GPIO_Port GPIOI

/* USER CODE BEGIN Private defines */

/* USER CODE END Private defines */

#ifdef __cplusplus
}
#endif

#endif /* __MAIN_H */
