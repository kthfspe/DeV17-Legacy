// Created by Oscar Eriksson in June 2022
#ifndef _CAN_CAN1_
#define _CAN_CAN1_
 
#include "stdint.h"
#include "kthfspe_can.h"
 
 
typedef struct {
    int8_t mux_ID;
    float fan1_speed;
    float fan2_speed;
    float fan3_speed;
    float fron_pump_speed;
    float rear_pump_speed;
    float inverter_pump_speed;
} can1_mcu_set_ccu_cooling_points_t;
 
typedef struct {
    int8_t digital_input;
    int8_t discharge_relay_open;
    float discharge_resistor_temperature;
    float extra_temperature;
} can1_ccu_status_2_t;
 
typedef struct {
    int8_t mux_ID;
    float fan1_temperature;
    float fan2_temperature;
    float fan3_temperature;
    float fron_pump_temperature;
    float rear_pump_temperature;
    float inverter_pump_temperature;
} can1_ccu_status_1_t;
 
void can1_mcu_set_ccu_cooling_points_receive_callback(can1_mcu_set_ccu_cooling_points_t* can1_mcu_set_ccu_cooling_points);
 
 
void can1_ccu_status_1_transmit_callback(can1_ccu_status_1_t* can1_ccu_status_1);
 
void can1_ccu_status_2_transmit_callback(can1_ccu_status_2_t* can1_ccu_status_2);
 
 
void can1_ccu_status_1_transmit();
 
void can1_ccu_status_2_transmit();
 
 
uint8_t can1_mcu_set_ccu_cooling_points_decode(can1_mcu_set_ccu_cooling_points_t* can1_mcu_set_ccu_cooling_points, uint8_t data[8]);
 
 
uint8_t can1_ccu_status_1_encode(can1_ccu_status_1_t* can1_ccu_status_1, uint8_t data[8]);
 
uint8_t can1_ccu_status_2_encode(can1_ccu_status_2_t* can1_ccu_status_2, uint8_t data[8]);
 
 
#endif