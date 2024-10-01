/*
 * display.c
 *
 *  Created on: May 23, 2020
 *      Author: tore
 */
#include "../lv_conf.h"
#include "lvgl.h"

#include "display.h"
#include "main.h"
#include "cmsis_os.h"
#include "stm32f7xx_hal.h"
#include "otm8009a.h"

/*For LittlevGL*/
static void disp_flush_cb(lv_disp_drv_t * drv, const lv_area_t * area, lv_color_t * color_p);
static lv_disp_drv_t disp_drv;

extern DSI_HandleTypeDef hdsi;
extern LTDC_HandleTypeDef hltdc;
extern osMutexId_t lvgl_mutexHandle;

void disp_init(void){
	static lv_disp_draw_buf_t draw_buf;
	static lv_color_t buf_1[DISP_HOR_RES * 100];
	//static lv_color_t buf_2[DISP_HOR_RES * 50];
	lv_disp_draw_buf_init(&draw_buf, buf_1, NULL, DISP_HOR_RES * 100);

	lv_disp_drv_init(&disp_drv);          /*Basic initialization*/
	disp_drv.flush_cb = disp_flush_cb;    /*Set your driver function*/
	disp_drv.draw_buf = &draw_buf;          /*Assign the buffer to the display*/
	disp_drv.hor_res = DISP_HOR_RES;   /*Set the horizontal resolution of the display*/
	disp_drv.ver_res = DISP_VER_RES;   /*Set the vertical resolution of the display*/
	lv_disp_drv_register(&disp_drv);      /*Finally register the driver*/
}

static void disp_flush_cb(lv_disp_drv_t * drv, const lv_area_t * area, lv_color_t * color_p)
{
	SCB_InvalidateICache();

	SCB_CleanInvalidateDCache();

	__HAL_DSI_WRAPPER_DISABLE(&hdsi);

	LTDC_Layer1->CFBAR = (uint32_t)color_p;

	const uint16_t width = lv_area_get_width(area);
	const uint16_t height = lv_area_get_height(area);

	LTDC->AWCR = ((width + 1) << 16) | (height + 1);
	LTDC->TWCR = ((width + 1 + 1) << 16) | (height + 1 + 1);

	const uint16_t layer_x0 = 2 + 0;
	const uint16_t layer_x1 = 2 + width - 1;
	LTDC_Layer1->WHPCR = (layer_x1 << 16) | layer_x0;

	const uint16_t layer_y0 = 2 + 0;
	const uint16_t layer_y1 = 2 + height - 1;
	LTDC_Layer1->WVPCR = (layer_y1 << 16) | layer_y0;

	LTDC_Layer1->CFBLR = ((width * 4) << 16) | (width * 4 + 3);
	LTDC_Layer1->CFBLNR = height;

	/* reload shadow registers and enable LTDC */
	LTDC->SRCR = (uint32_t)LTDC_SRCR_IMR;

	 /*Configures display area accordingly*/
	 /*Send Page Address Set DCS Command to display, this sets the start and end address in the GRAM of which the MCU can access*/
	int16_t xS = area->x1;
	int16_t xE = area->x2;
	uint8_t columnAddress[4] = {(uint8_t)(xS >> 8),(uint8_t)(xS & 0xFF),(uint8_t)(xE >> 8),(uint8_t)(xE & 0xFF)};
	HAL_DSI_LongWrite(&hdsi, 0, DSI_DCS_LONG_PKT_WRITE, 4, OTM8009A_CMD_CASET, columnAddress);

	int16_t yS = area->y1;
	int16_t yE = area->y2;
	uint8_t pageAddress[4] = {(uint8_t)(yS >> 8),(uint8_t)(yS & 0xFF),(uint8_t)(yE >> 8),(uint8_t)(yE & 0xFF)};;
	HAL_DSI_LongWrite(&hdsi, 0, DSI_DCS_LONG_PKT_WRITE, 4, OTM8009A_CMD_PASET, pageAddress);

	__HAL_DSI_WRAPPER_ENABLE(&hdsi);

	/*Refresh the display*/
	HAL_DSI_Refresh(&hdsi);
}

void HAL_DSI_EndOfRefreshCallback(DSI_HandleTypeDef *hdsi){
	osMutexAcquire(lvgl_mutexHandle, osWaitForever);
	lv_disp_flush_ready(&disp_drv); // Tell lvgl that update is done
	osMutexRelease(lvgl_mutexHandle);
}
