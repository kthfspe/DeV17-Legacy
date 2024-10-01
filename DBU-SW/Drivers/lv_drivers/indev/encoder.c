/*
 * mousewheel.c
 *
 *  Created on: Jan 23, 2021
 *      Author: tore
 */
#include "encoder.h"
#include "stm32f7xx_hal.h"
extern uint32_t enc_btn;
extern uint32_t enc_inc;

void encoder_read(lv_indev_drv_t *drv, lv_indev_data_t *data);
lv_indev_drv_t indev_drv;

void enc_init(void) {
	lv_indev_drv_init(&indev_drv); /*Basic initialization*/
	indev_drv.type = LV_INDEV_TYPE_ENCODER; /*See below.*/
	indev_drv.read_cb = encoder_read; /*See below.*/
	/*Register the driver in LVGL and save the created input device object*/
	lv_indev_drv_register(&indev_drv);
}

void encoder_read(lv_indev_drv_t *drv, lv_indev_data_t *data) {
	data->enc_diff = enc_inc;

	if (HAL_GPIO_ReadPin(GPIOA, GPIO_PIN_0))
		data->state = LV_INDEV_STATE_PRESSED;
	else
		data->state = LV_INDEV_STATE_RELEASED;
}
