/**
 * @file indev.c
 *
 */

/*********************
 *      INCLUDES
 *********************/
#include "display.h"
#include "lvgl.h"
/* Include TouchScreen component driver */
#include "ft6x06.h"
#include "touch.h"

#include "stm32f7xx.h"
#include <stdio.h>

/*********************
 *      DEFINES
 *********************/

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/
static bool touch_read_cb(lv_indev_drv_t * drv, lv_indev_data_t *data);

/**********************
 *  STATIC VARIABLES
 **********************/
static TS_StateTypeDef  TS_State;
static TS_DrvTypeDef *ts_driver;
static uint8_t  ts_orientation;
uint8_t  I2C_Address = 0;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/

/**
 * Initialize your input devices here
 */
void touch_init(void)
{
  TS_Init(DISP_HOR_RES, DISP_VER_RES);

  static lv_indev_drv_t indev_drv;
  lv_indev_drv_init(&indev_drv);
  indev_drv.read_cb = touch_read_cb;
  indev_drv.type = LV_INDEV_TYPE_POINTER;
  lv_indev_drv_register(&indev_drv);
}

/**********************
 *   STATIC FUNCTIONS
 **********************/

static bool touch_read_cb(lv_indev_drv_t * drv, lv_indev_data_t *data)
{
	static int16_t last_x = 0;
	static int16_t last_y = 0;

	TS_GetState(&TS_State);
	if(TS_State.touchDetected != 0) {
		data->point.x = TS_State.touchX[0];
		data->point.y = TS_State.touchY[0];
		last_x = data->point.x;
		last_y = data->point.y;
		data->state = LV_INDEV_STATE_PR;
	} else {
		data->point.x = last_x;
		data->point.y = last_y;
		data->state = LV_INDEV_STATE_REL;
	}

	return false;
}

/**
  * @brief  Initializes and configures the touch screen functionalities and
  *         configures all necessary hardware resources (GPIOs, I2C, clocks..).
  * @param  ts_SizeX : Maximum X size of the TS area on LCD
  * @param  ts_SizeY : Maximum Y size of the TS area on LCD
  * @retval TS_OK if all initializations are OK. Other value if error.
  */
uint8_t TS_Init(uint16_t ts_SizeX, uint16_t ts_SizeY)
{
  uint8_t ts_status = TS_OK;
  uint8_t ts_id1, ts_id2 = 0;
  /* Note : I2C_Address is un-initialized here, but is not used at all in init function */
  /* but the prototype of Init() is like that in template and should be respected       */

  /* Initialize the communication channel to sensor (I2C) if necessary */
  /* that is initialization is done only once after a power up         */
  ft6x06_ts_drv.Init(I2C_Address);

  ts_id1 = ft6x06_ts_drv.ReadID(TS_I2C_ADDRESS);
  if(ts_id1 != FT6206_ID_VALUE)
  {
    ts_id2 = ft6x06_ts_drv.ReadID(TS_I2C_ADDRESS_A02);
    I2C_Address    = TS_I2C_ADDRESS_A02;
  }
  else
  {
    I2C_Address    = TS_I2C_ADDRESS;
  }

  /* Scan FT6xx6 TouchScreen IC controller ID register by I2C Read       */
  /* Verify this is a FT6206 or FT6336G, otherwise this is an error case */
  if((ts_id1 == FT6206_ID_VALUE) || (ts_id2 == FT6206_ID_VALUE))
  {
    /* Found FT6206 : Initialize the TS driver structure */
    ts_driver = &ft6x06_ts_drv;

    /* Get LCD chosen orientation */
    if(ts_SizeX < ts_SizeY)
    {
      ts_orientation = TS_SWAP_NONE;
    }
    else
    {
      ts_orientation = TS_SWAP_XY | TS_SWAP_Y;
    }

    if(ts_status == TS_OK)
    {
      /* Software reset the TouchScreen */
      ts_driver->Reset(I2C_Address);

      /* Calibrate, Configure and Start the TouchScreen driver */
      ts_driver->Start(I2C_Address);

    } /* of if(ts_status == TS_OK) */
  }
  else
  {
    ts_status = TS_DEVICE_NOT_FOUND;
  }

  return (ts_status);
}

/**
  * @brief  Returns status and positions of the touch screen.
  * @param  TS_State: Pointer to touch screen current state structure
  * @retval TS_OK if all initializations are OK. Other value if error.
  */
uint8_t TS_GetState(TS_StateTypeDef *TS_State)
{
  static uint32_t _x[TS_MAX_NB_TOUCH] = {0, 0};
  static uint32_t _y[TS_MAX_NB_TOUCH] = {0, 0};
  uint8_t ts_status = TS_OK;
  uint16_t tmp;
  uint16_t Raw_x[TS_MAX_NB_TOUCH];
  uint16_t Raw_y[TS_MAX_NB_TOUCH];
  uint16_t xDiff;
  uint16_t yDiff;
  uint32_t index;
#if (TS_MULTI_TOUCH_SUPPORTED == 1)
  uint32_t weight = 0;
  uint32_t area = 0;
  uint32_t event = 0;
#endif /* TS_MULTI_TOUCH_SUPPORTED == 1 */

  /* Check and update the number of touches active detected */
  TS_State->touchDetected = ts_driver->DetectTouch(I2C_Address);
  if(TS_State->touchDetected)
  {
    for(index=0; index < TS_State->touchDetected; index++)
    {
      /* Get each touch coordinates */
      ts_driver->GetXY(I2C_Address, &(Raw_x[index]), &(Raw_y[index]));

      if(ts_orientation & TS_SWAP_XY)
      {
        tmp = Raw_x[index];
        Raw_x[index] = Raw_y[index];
        Raw_y[index] = tmp;
      }

      if(ts_orientation & TS_SWAP_X)
      {
        Raw_x[index] = FT_6206_MAX_WIDTH - 1 - Raw_x[index];
      }

      if(ts_orientation & TS_SWAP_Y)
      {
        Raw_y[index] = FT_6206_MAX_HEIGHT - 1 - Raw_y[index];
      }

      xDiff = Raw_x[index] > _x[index]? (Raw_x[index] - _x[index]): (_x[index] - Raw_x[index]);
      yDiff = Raw_y[index] > _y[index]? (Raw_y[index] - _y[index]): (_y[index] - Raw_y[index]);

      if ((xDiff + yDiff) > 5)
      {
        _x[index] = Raw_x[index];
        _y[index] = Raw_y[index];
      }


      TS_State->touchX[index] = _x[index];
      TS_State->touchY[index] = _y[index];

#if (TS_MULTI_TOUCH_SUPPORTED == 1)

      /* Get touch info related to the current touch */
      ft6x06_TS_GetTouchInfo(I2C_Address, index, &weight, &area, &event);

      /* Update TS_State structure */
      TS_State->touchWeight[index] = weight;
      TS_State->touchArea[index]   = area;

      /* Remap touch event */
      switch(event)
      {
        case FT6206_TOUCH_EVT_FLAG_PRESS_DOWN  :
          TS_State->touchEventId[index] = TOUCH_EVENT_PRESS_DOWN;
          break;
        case FT6206_TOUCH_EVT_FLAG_LIFT_UP :
          TS_State->touchEventId[index] = TOUCH_EVENT_LIFT_UP;
          break;
        case FT6206_TOUCH_EVT_FLAG_CONTACT :
          TS_State->touchEventId[index] = TOUCH_EVENT_CONTACT;
          break;
        case FT6206_TOUCH_EVT_FLAG_NO_EVENT :
          TS_State->touchEventId[index] = TOUCH_EVENT_NO_EVT;
          break;
        default :
          ts_status = TS_ERROR;
          break;
      } /* of switch(event) */

#endif /* TS_MULTI_TOUCH_SUPPORTED == 1 */

    } /* of for(index=0; index < TS_State->touchDetected; index++) */

#if (TS_MULTI_TOUCH_SUPPORTED == 1)
    /* Get gesture Id */
    ts_status = BSP_TS_Get_GestureId(TS_State);
#endif /* TS_MULTI_TOUCH_SUPPORTED == 1 */

  } /* end of if(TS_State->touchDetected != 0) */

  return (ts_status);
}
