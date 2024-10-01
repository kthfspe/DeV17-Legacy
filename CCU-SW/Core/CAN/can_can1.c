// Created by Oscar Eriksson in June 2022
#include "stdint.h"
#include "string.h"
#include "can_can1.h"
 
__weak void can1_mcu_set_ccu_cooling_points_receive_callback(can1_mcu_set_ccu_cooling_points_t* can1_mcu_set_ccu_cooling_points){
   return; 
}
 
 
__weak void can1_ccu_status_1_transmit_callback(can1_ccu_status_1_t* can1_ccu_status_1){
   return; 
}
 
__weak void can1_ccu_status_2_transmit_callback(can1_ccu_status_2_t* can1_ccu_status_2){
   return; 
}
 
 
uint8_t can1_mcu_set_ccu_cooling_points_decode(can1_mcu_set_ccu_cooling_points_t* can1_mcu_set_ccu_cooling_points, uint8_t data[8]){
    int8_t mux_ID = 0;
    mux_ID |= ((uint8_t)(data[0] & 0xff));
    can1_mcu_set_ccu_cooling_points->mux_ID = (1.0 * (double)mux_ID) + 0.0;

    switch(mux_ID) {
        case 0x00: {
            int8_t fan1_speed = 0;
            fan1_speed |= ((uint8_t)(data[1] & 0xff));
            can1_mcu_set_ccu_cooling_points->fan1_speed = (1.0 * (double)fan1_speed) + 0.0;

            int8_t fron_pump_speed = 0;
            fron_pump_speed |= ((uint8_t)(data[2] & 0xff));
            can1_mcu_set_ccu_cooling_points->fron_pump_speed = (1.0 * (double)fron_pump_speed) + 0.0;

            if((can1_mcu_set_ccu_cooling_points->fan1_speed < 0) || (100 < can1_mcu_set_ccu_cooling_points->fan1_speed)) return 0;
            if((can1_mcu_set_ccu_cooling_points->fron_pump_speed < 0) || (100 < can1_mcu_set_ccu_cooling_points->fron_pump_speed)) return 0;
        }
        break;
        case 0x01: {
            int8_t fan2_speed = 0;
            fan2_speed |= ((uint8_t)(data[1] & 0xff));
            can1_mcu_set_ccu_cooling_points->fan2_speed = (1.0 * (double)fan2_speed) + 0.0;

            int8_t rear_pump_speed = 0;
            rear_pump_speed |= ((uint8_t)(data[2] & 0xff));
            can1_mcu_set_ccu_cooling_points->rear_pump_speed = (1.0 * (double)rear_pump_speed) + 0.0;

            if((can1_mcu_set_ccu_cooling_points->fan2_speed < 0) || (100 < can1_mcu_set_ccu_cooling_points->fan2_speed)) return 0;
            if((can1_mcu_set_ccu_cooling_points->rear_pump_speed < 0) || (100 < can1_mcu_set_ccu_cooling_points->rear_pump_speed)) return 0;
        }
        break;
        case 0x02: {
            int8_t fan3_speed = 0;
            fan3_speed |= ((uint8_t)(data[1] & 0xff));
            can1_mcu_set_ccu_cooling_points->fan3_speed = (1.0 * (double)fan3_speed) + 0.0;

            int8_t inverter_pump_speed = 0;
            inverter_pump_speed |= ((uint8_t)(data[2] & 0xff));
            can1_mcu_set_ccu_cooling_points->inverter_pump_speed = (1.0 * (double)inverter_pump_speed) + 0.0;

            if((can1_mcu_set_ccu_cooling_points->fan3_speed < 0) || (100 < can1_mcu_set_ccu_cooling_points->fan3_speed)) return 0;
            if((can1_mcu_set_ccu_cooling_points->inverter_pump_speed < 0) || (100 < can1_mcu_set_ccu_cooling_points->inverter_pump_speed)) return 0;
        }
        break;
    }
    return 1;
}

 
 
uint8_t can1_ccu_status_1_encode(can1_ccu_status_1_t* can1_ccu_status_1, uint8_t data[8]) {
    memset(data, 0, 8);
    int8_t mux_ID = 1.0 * ((double)can1_ccu_status_1->mux_ID - 0.0);
    data[0] |= (uint8_t)mux_ID & 0xff;

    switch(mux_ID) {
        case 0x00: {
            int8_t fan1_temperature = 1.0 * ((double)can1_ccu_status_1->fan1_temperature - 0.0);
            data[1] |= (uint8_t)fan1_temperature & 0xff;

            int8_t fron_pump_temperature = 1.0 * ((double)can1_ccu_status_1->fron_pump_temperature - 0.0);
            data[2] |= (uint8_t)fron_pump_temperature & 0xff;

            if((can1_ccu_status_1->fan1_temperature < 0) || (100 < can1_ccu_status_1->fan1_temperature)) return 0;
            if((can1_ccu_status_1->fron_pump_temperature < 0) || (100 < can1_ccu_status_1->fron_pump_temperature)) return 0;
        }
        break;
        case 0x01: {
            int8_t fan2_temperature = 1.0 * ((double)can1_ccu_status_1->fan2_temperature - 0.0);
            data[1] |= (uint8_t)fan2_temperature & 0xff;

            int8_t rear_pump_temperature = 1.0 * ((double)can1_ccu_status_1->rear_pump_temperature - 0.0);
            data[2] |= (uint8_t)rear_pump_temperature & 0xff;

            if((can1_ccu_status_1->fan2_temperature < 0) || (100 < can1_ccu_status_1->fan2_temperature)) return 0;
            if((can1_ccu_status_1->rear_pump_temperature < 0) || (100 < can1_ccu_status_1->rear_pump_temperature)) return 0;
        }
        break;
        case 0x02: {
            int8_t fan3_temperature = 1.0 * ((double)can1_ccu_status_1->fan3_temperature - 0.0);
            data[1] |= (uint8_t)fan3_temperature & 0xff;

            int8_t inverter_pump_temperature = 1.0 * ((double)can1_ccu_status_1->inverter_pump_temperature - 0.0);
            data[2] |= (uint8_t)inverter_pump_temperature & 0xff;

            if((can1_ccu_status_1->fan3_temperature < 0) || (100 < can1_ccu_status_1->fan3_temperature)) return 0;
            if((can1_ccu_status_1->inverter_pump_temperature < 0) || (100 < can1_ccu_status_1->inverter_pump_temperature)) return 0;
        }
        break;
    }
    return 1;
}

 
uint8_t can1_ccu_status_2_encode(can1_ccu_status_2_t* can1_ccu_status_2, uint8_t data[8]) {
    memset(data, 0, 8);
    int8_t digital_input = 1.0 * ((double)can1_ccu_status_2->digital_input - 0.0);
    data[0] |= (uint8_t)digital_input & 0x01;

    int8_t discharge_relay_open = 1.0 * ((double)can1_ccu_status_2->discharge_relay_open - 0.0);
    data[0] |= (uint8_t)((uint8_t)discharge_relay_open << (uint8_t)1) & 0x02;

    int16_t discharge_resistor_temperature = 1.0 * ((double)can1_ccu_status_2->discharge_resistor_temperature - 0.0);
    data[1] |= (uint8_t)discharge_resistor_temperature & 0xff;
    data[2] |= (uint8_t)((uint16_t)discharge_resistor_temperature >> (uint16_t)8) & 0x0f;

    int16_t extra_temperature = 1.0 * ((double)can1_ccu_status_2->extra_temperature - 0.0);
    data[2] |= (uint8_t)((uint16_t)extra_temperature << (uint16_t)4) & 0xf0;
    data[3] |= (uint8_t)((uint16_t)extra_temperature >> (uint16_t)4) & 0xff;

    if((can1_ccu_status_2->discharge_resistor_temperature < -10) || (190 < can1_ccu_status_2->discharge_resistor_temperature)) return 0;
    if((can1_ccu_status_2->extra_temperature < -10) || (190 < can1_ccu_status_2->extra_temperature)) return 0;
    return 1;
}

 
 