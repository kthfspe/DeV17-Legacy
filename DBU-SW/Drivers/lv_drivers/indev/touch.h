/**
 * @file indev.h
 *
 */

#ifndef INDEV_H
#define INDEV_H

/*********************
 *      INCLUDES
 *********************/
#include <stdbool.h>
#include <stdint.h>
#include "../../Drivers/ft6x06/ft6x06.h"

/*********************
 *      DEFINES
 *********************/
#define TS_MAX_NB_TOUCH                 ((uint32_t) FT6206_MAX_DETECTABLE_TOUCH)

#define TS_NO_IRQ_PENDING               ((uint8_t) 0)
#define TS_IRQ_PENDING                  ((uint8_t) 1)

#define TS_SWAP_NONE                    ((uint8_t) 0x01)
#define TS_SWAP_X                       ((uint8_t) 0x02)
#define TS_SWAP_Y                       ((uint8_t) 0x04)
#define TS_SWAP_XY                      ((uint8_t) 0x08)

/**
  * @brief TouchScreen FT6206 Slave I2C address 1
  */
#define TS_I2C_ADDRESS                   ((uint16_t)0x54)

/**
  * @brief TouchScreen FT6336G Slave I2C address 2
  */
#define TS_I2C_ADDRESS_A02               ((uint16_t)0x70)

/**********************
 *      TYPEDEFS
 **********************/
/**
*  @brief TS_StateTypeDef
*  Define TS State structure
*/
typedef struct
{
  uint8_t  touchDetected;                /*!< Total number of active touches detected at last scan */
  uint16_t touchX[TS_MAX_NB_TOUCH];      /*!< Touch X[0], X[1] coordinates on 12 bits */
  uint16_t touchY[TS_MAX_NB_TOUCH];      /*!< Touch Y[0], Y[1] coordinates on 12 bits */

#if (TS_MULTI_TOUCH_SUPPORTED == 1)
  uint8_t  touchWeight[TS_MAX_NB_TOUCH]; /*!< Touch_Weight[0], Touch_Weight[1] : weight property of touches */
  uint8_t  touchEventId[TS_MAX_NB_TOUCH];     /*!< Touch_EventId[0], Touch_EventId[1] : take value of type @ref TS_TouchEventTypeDef */
  uint8_t  touchArea[TS_MAX_NB_TOUCH];   /*!< Touch_Area[0], Touch_Area[1] : touch area of each touch */
  uint32_t gestureId; /*!< type of gesture detected : take value of type @ref TS_GestureIdTypeDef */
#endif  /* TS_MULTI_TOUCH_SUPPORTED == 1 */

} TS_StateTypeDef;

/**
 *  @brief TS_StatusTypeDef
 *  Define BSP_TS_xxx() functions possible return value,
 *  when status is returned by those functions.
 */
typedef enum
{
  TS_OK                = 0x00, /*!< Touch Ok */
  TS_ERROR             = 0x01, /*!< Touch Error */
  TS_TIMEOUT           = 0x02, /*!< Touch Timeout */
  TS_DEVICE_NOT_FOUND  = 0x03  /*!< Touchscreen device not found */
} TS_StatusTypeDef;
#if 0
/**
 *  @brief TS_GestureIdTypeDef
 *  Define Possible managed gesture identification values returned by touch screen
 *  driver.
 */
typedef enum
{
  GEST_ID_NO_GESTURE = 0x00, /*!< Gesture not defined / recognized */
  GEST_ID_MOVE_UP    = 0x01, /*!< Gesture Move Up */
  GEST_ID_MOVE_RIGHT = 0x02, /*!< Gesture Move Right */
  GEST_ID_MOVE_DOWN  = 0x03, /*!< Gesture Move Down */
  GEST_ID_MOVE_LEFT  = 0x04, /*!< Gesture Move Left */
  GEST_ID_ZOOM_IN    = 0x05, /*!< Gesture Zoom In */
  GEST_ID_ZOOM_OUT   = 0x06, /*!< Gesture Zoom Out */
  GEST_ID_NB_MAX     = 0x07 /*!< max number of gesture id */
} TS_GestureIdTypeDef;

/**
 *  @brief TS_TouchEventTypeDef
 *  Define Possible touch events kind as returned values
 *  by touch screen IC Driver.
 */
typedef enum
{
  TOUCH_EVENT_NO_EVT        = 0x00, /*!< Touch Event : undetermined */
  TOUCH_EVENT_PRESS_DOWN    = 0x01, /*!< Touch Event Press Down */
  TOUCH_EVENT_LIFT_UP       = 0x02, /*!< Touch Event Lift Up */
  TOUCH_EVENT_CONTACT       = 0x03, /*!< Touch Event Contact */
  TOUCH_EVENT_NB_MAX        = 0x04  /*!< max number of touch events kind */
} TS_TouchEventTypeDef;

#endif


/**********************
 * GLOBAL PROTOTYPES
 **********************/
void touch_init(void);
uint8_t TS_Init(uint16_t ts_SizeX, uint16_t ts_SizeY);
uint8_t TS_GetState(TS_StateTypeDef *TS_State);

/**********************
 *      MACROS
 **********************/

#endif
