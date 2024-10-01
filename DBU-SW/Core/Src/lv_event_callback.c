/*
 * lv_event_callback.c
 *
 *  Created on: 30 aug. 2021
 *      Author: tore
 */
#include "lv_event_callback.h"

extern lv_obj_t *manual_mode_btn;
extern lv_obj_t *dv_mode_btn;

void event_handler(lv_event_t *e) {
	lv_event_code_t code = lv_event_get_code(e);
	lv_obj_t *target = lv_event_get_current_target(e);

	if (target == manual_mode_btn) {
		if (code == LV_EVENT_VALUE_CHANGED) {
			lv_obj_clear_state(dv_mode_btn, LV_STATE_ANY);
		}
		if(code == LV_EVENT_CLICKED){
			dashboard_open(0);
		}
	}
	if (target == dv_mode_btn) {
		if (code == LV_EVENT_VALUE_CHANGED) {
			lv_obj_clear_state(manual_mode_btn, LV_STATE_ANY);
		}
		if(code == LV_EVENT_CLICKED){
			//mission_select_open(0);
		}
	}

}
