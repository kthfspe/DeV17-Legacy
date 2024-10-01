/*
 * lv_dashboard_unit.c
 *
 *  Created on: Jan 23, 2021
 *      Author: tore
 */
#include "lv_dashboard_unit.h"
#include "lv_event_callback.h"
#include "lvgl.h"

#define COLOR_KTHFS_RED lv_color_make(0xCE, 0x17, 0xA)
#define COLOR_KTHFS_BLUE lv_color_make(0x00, 0x76, 0xC0)
#define USER_COLOR_GRAY lv_color_make(0x19, 0x1e, 0x1e)
#define USER_COLOR_LIGHT_GRAY lv_color_make(0x37, 0x37, 0x37)
#define USER_COLOR_GREEN lv_color_make(0x00, 0xC0, 0x76)
#define USER_COLOR_YELLOW lv_color_make(0x00, 0xC0, 0x76)
#define USER_COLOR_RED lv_color_make(0xC0, 0x00, 0x16)

LV_IMG_DECLARE(kthfs)
LV_FONT_DECLARE(Montserrat_96_Bold)

void dashboard_open(uint32_t delay);
void dv_open(uint32_t delay);
void settings_open(uint32_t delay);
void mode_select_open(uint32_t delay);

static lv_obj_t* lv_splash_screen_create(lv_obj_t *parent);
static lv_obj_t* lv_dashboard_create(lv_obj_t *parent);
static lv_obj_t* lv_dv_scr_create(lv_obj_t *parent);
static lv_obj_t* lv_settings_create(lv_obj_t *parent);
static lv_obj_t* lv_mode_select_create(lv_obj_t *parent);

static lv_obj_t* add_dv_tile(lv_obj_t *parent, lv_coord_t x, lv_coord_t y,
		lv_coord_t w, lv_coord_t h, lv_color_t bg_color);

static lv_obj_t *splash;
static lv_obj_t *dashboard;
static lv_obj_t *dv_scr;
static lv_obj_t *settings;
static lv_obj_t *mode_select;

lv_obj_t *manual_mode_btn;
lv_obj_t *dv_mode_btn;

static lv_point_t vertical_line_points[] = { { 0, 100 }, { 0, 460 } };
static lv_point_t horizontal_line_points[] = { { 0, 0 }, { 798, 0 } };
static lv_point_t horizontal_divider_line_points[] =
		{ { 0, 0 }, { 800 / 3, 0 } };

static const char *labels[] = { "kilowatt", "kph", "motor", "battery" };

void lv_dashboard(void) {
	// Create all screens
	splash = lv_splash_screen_create(NULL);
	dashboard = lv_dashboard_create(NULL);
	dv_scr = lv_dv_scr_create(NULL);
	settings = lv_settings_create(NULL);
	//mode_select = lv_mode_select_create(NULL);

	lv_scr_load(splash);
	//dashboard_open(2000);
	mode_select_open(2480); // In time with indicator animation
}

void dashboard_open(uint32_t delay) {
	if (lv_scr_act() == splash) {

		lv_scr_load_anim(dashboard, LV_SCR_LOAD_ANIM_MOVE_TOP, 500, delay,
		true);
	} else {
		lv_scr_load(dashboard);
	}

}
void dv_open(uint32_t delay) {
	if (lv_scr_act() == splash) {
		lv_scr_load_anim(dv_scr, LV_SCR_LOAD_ANIM_OVER_TOP, 500, delay, true);
	}
}

void settings_open(uint32_t delay) {

}

void mode_select_open(uint32_t delay) {
	if (mode_select == NULL) {
		mode_select = lv_mode_select_create(NULL);
	}
	if (lv_scr_act() == splash) {

		lv_scr_load_anim(mode_select, LV_SCR_LOAD_ANIM_MOVE_TOP, 500, delay,
		true);
	} else {
		lv_scr_load(mode_select);
	}

}

static lv_obj_t* lv_splash_screen_create(lv_obj_t *parent) {
	lv_obj_t *splash = lv_obj_create(parent);
	lv_obj_set_style_bg_color(splash, lv_color_white(), LV_STATE_DEFAULT);

	// Create img object
	lv_obj_t *logo = lv_img_create(splash);
	lv_img_set_src(logo, &kthfs);
	lv_obj_align(logo, LV_ALIGN_CENTER, 0, 0);

	//Create a Label object
	lv_obj_t *text = lv_label_create(splash);
	lv_label_set_text(text, "DeV17");
	lv_obj_set_style_text_font(text, &lv_font_montserrat_14, LV_STATE_DEFAULT);
	lv_obj_set_style_text_color(text, COLOR_KTHFS_BLUE, LV_STATE_DEFAULT);
	lv_obj_align(text, LV_ALIGN_CENTER, 0, 180);

	return splash;
}

static lv_obj_t* lv_dashboard_create(lv_obj_t *parent) {
	lv_obj_t *dashboard = lv_obj_create(parent);
	lv_obj_set_style_bg_color(dashboard, USER_COLOR_GRAY, LV_STATE_DEFAULT);

	lv_obj_t *soc_bar = lv_bar_create(dashboard);
	lv_obj_set_size(soc_bar, 800, 20);
	lv_obj_set_style_radius(soc_bar, 0, LV_PART_INDICATOR);
	lv_obj_set_style_radius(soc_bar, 0, LV_PART_MAIN);
	lv_obj_center(soc_bar);
	lv_obj_align(soc_bar, LV_ALIGN_BOTTOM_MID, 0, 0);
	lv_bar_set_value(soc_bar, 70, LV_ANIM_ON);
	lv_obj_set_style_bg_color(soc_bar, lv_palette_main(LV_PALETTE_GREEN),
			LV_PART_INDICATOR);
	lv_obj_set_style_bg_color(soc_bar, lv_palette_main(LV_PALETTE_GREY),
			LV_PART_MAIN);

	/*Create style*/
	static lv_style_t style_line;
	lv_style_init(&style_line);
	lv_style_set_line_width(&style_line, 2);
	lv_style_set_line_color(&style_line, USER_COLOR_LIGHT_GRAY);

	/*Create a line and apply the new style*/
	lv_obj_t *line;
	line = lv_line_create(dashboard);
	lv_line_set_points(line, vertical_line_points, 2); /*Set the points*/
	lv_obj_add_style(line, &style_line, 0);
	lv_obj_set_pos(line, 800 / 3, 0);

	line = lv_line_create(dashboard);
	lv_line_set_points(line, vertical_line_points, 2); /*Set the points*/
	lv_obj_add_style(line, &style_line, 0);
	lv_obj_set_pos(line, 2 * 800 / 3, 0);

	line = lv_line_create(dashboard);
	lv_line_set_points(line, horizontal_line_points, 2); /*Set the points*/
	lv_obj_add_style(line, &style_line, 0);
	lv_obj_set_pos(line, 0, 100);

	line = lv_line_create(dashboard);
	lv_line_set_points(line, horizontal_divider_line_points, 2); /*Set the points*/
	lv_obj_add_style(line, &style_line, 0);
	lv_obj_set_pos(line, 0, 280);

	line = lv_line_create(dashboard);
	lv_line_set_points(line, horizontal_divider_line_points, 2); /*Set the points*/
	lv_obj_add_style(line, &style_line, 0);
	lv_obj_set_pos(line, (800 / 3), 220);

	line = lv_line_create(dashboard);
	lv_line_set_points(line, horizontal_divider_line_points, 2); /*Set the points*/
	lv_obj_add_style(line, &style_line, 0);
	lv_obj_set_pos(line, (800 / 3), 220 + 120);

	line = lv_line_create(dashboard);
	lv_line_set_points(line, horizontal_divider_line_points, 2); /*Set the points*/
	lv_obj_add_style(line, &style_line, 0);
	lv_obj_set_pos(line, 2 * (800 / 3) - 1, 280);

	/* Static labels */

	static lv_style_t style_label;
	lv_style_init(&style_label);
	lv_style_set_text_color(&style_label, lv_palette_main(LV_PALETTE_GREY));
	lv_style_set_text_font(&style_label, &lv_font_montserrat_14);
	lv_style_set_text_align(&style_label, LV_TEXT_ALIGN_CENTER);

	lv_obj_t *label;
	label = lv_label_create(dashboard);
	lv_obj_add_style(label, &style_label, LV_PART_MAIN);
	lv_label_set_text_static(label, labels[0]);
	lv_obj_align(label, LV_ALIGN_CENTER, (-800 / 3), 10);

	label = lv_label_create(dashboard);
	lv_obj_add_style(label, &style_label, LV_PART_MAIN);
	lv_label_set_text_static(label, labels[1]);
	lv_obj_align(label, LV_ALIGN_CENTER, (800 / 3), 10);

	label = lv_label_create(dashboard);
	lv_obj_add_style(label, &style_label, LV_PART_MAIN);
	lv_label_set_text_static(label, labels[2]);
	lv_obj_align(label, LV_ALIGN_CENTER, (-800 / 3), 240 - 20 - 30);

	label = lv_label_create(dashboard);
	lv_obj_add_style(label, &style_label, LV_PART_MAIN);
	lv_label_set_text_static(label, labels[3]);
	lv_obj_align(label, LV_ALIGN_CENTER, (800 / 3), 240 - 20 - 30);

	label = lv_label_create(dashboard);
	lv_obj_add_style(label, &style_label, LV_PART_MAIN);
	lv_label_set_text_fmt(label, "lap");
	lv_obj_align(label, LV_ALIGN_CENTER, 0, -40);

	label = lv_label_create(dashboard);
	lv_obj_add_style(label, &style_label, LV_PART_MAIN);
	lv_label_set_text_fmt(label, "best");
	lv_obj_align(label, LV_ALIGN_CENTER, 0, 80);

	label = lv_label_create(dashboard);
	lv_obj_add_style(label, &style_label, LV_PART_MAIN);
	lv_label_set_text_fmt(label, "delta");
	lv_obj_align(label, LV_ALIGN_CENTER, 0, 200);

	static lv_style_t style_value;
	lv_style_init(&style_value);
	lv_style_set_text_color(&style_value, lv_color_white());
	lv_style_set_text_font(&style_value, &Montserrat_96_Bold);
	lv_style_set_text_align(&style_value, LV_TEXT_ALIGN_CENTER);

	lv_obj_t *power;
	power = lv_label_create(dashboard);
	lv_obj_add_style(power, &style_value, LV_PART_MAIN);
	lv_label_set_text_fmt(power, "%i", 47);
	lv_obj_align(power, LV_ALIGN_CENTER, (-800 / 3), -50);

	lv_obj_t *speed;
	speed = lv_label_create(dashboard);
	lv_obj_add_style(speed, &style_value, LV_PART_MAIN);
	lv_label_set_text_fmt(speed, "%i", 120);
	lv_obj_align(speed, LV_ALIGN_CENTER, (800 / 3), -50);

	lv_obj_t *motor;
	motor = lv_label_create(dashboard);
	lv_obj_add_style(motor, &style_value, LV_PART_MAIN);
	lv_label_set_text_fmt(motor, "%i", 27);
	lv_obj_align(motor, LV_ALIGN_CENTER, (-800 / 3), 130);

	lv_obj_t *battery;
	battery = lv_label_create(dashboard);
	lv_obj_add_style(battery, &style_value, LV_PART_MAIN);
	lv_label_set_text_fmt(battery, "%i", 32);
	lv_obj_align(battery, LV_ALIGN_CENTER, (800 / 3), 130);

	lv_obj_t *current;
	current = lv_label_create(dashboard);
	lv_obj_add_style(current, &style_value, LV_PART_MAIN);
	lv_obj_set_style_text_font(current, &lv_font_montserrat_14, LV_PART_MAIN);
	lv_label_set_text_fmt(current, "0%i:%i:%i", 1, 24, 10);
	lv_obj_align(current, LV_ALIGN_CENTER, 0, -80);

	lv_obj_t *target;
	target = lv_label_create(dashboard);
	lv_obj_add_style(target, &style_value, LV_PART_MAIN);
	lv_obj_set_style_text_font(target, &lv_font_montserrat_14, LV_PART_MAIN);
	lv_label_set_text_fmt(target, "0%i:%i:0%i", 1, 10, 0);
	lv_obj_align(target, LV_ALIGN_CENTER, 0, 40);

	lv_obj_t *delta;
	delta = lv_label_create(dashboard);
	lv_obj_add_style(delta, &style_value, LV_PART_MAIN);
	lv_obj_set_style_text_font(delta, &lv_font_montserrat_14, LV_PART_MAIN);
	lv_label_set_text_fmt(delta, "-0%i:%i:%i", 0, 14, 10);
	lv_obj_align(delta, LV_ALIGN_CENTER, 0, 160);

	return dashboard;
}

static lv_obj_t* lv_dv_scr_create(lv_obj_t *parent) {
//	lv_obj_t *dv = lv_obj_create(parent);
//	lv_obj_set_style_bg_color(dv, USER_COLOR_GRAY, LV_PART_MAIN);
//
//	lv_obj_t *temp = add_dv_tile(dv, 25, 25, 169, 202, USER_COLOR_LIGHT_GRAY);
//	lv_obj_t *gps = add_dv_tile(dv, 25 + 169 + 25, 25, 169, 202,
//	USER_COLOR_GREEN);
//	lv_obj_t *battery = add_dv_tile(dv, 25 + 169 + 25 + 169 + 25, 25, 169, 202,
//	USER_COLOR_YELLOW);
//	lv_obj_t *motor = add_dv_tile(dv, 25 + 169 + 25 + 169 + 25 + 169 + 25, 25,
//			169, 202, USER_COLOR_RED);
//	lv_obj_t *ami = add_dv_tile(dv, 25, 25 + 202 + 25, 750, 202,
//	COLOR_KTHFS_BLUE);
//
//	lv_obj_t *label = lv_label_create(ami);
//	lv_label_set_text(label, "MANUAL DRIVING"); /*Set the labels text*/
//	lv_obj_align(label, LV_ALIGN_CENTER, 0, 0);
//	lv_obj_set_style_text_font(label, &lv_font_montserrat_48, LV_STATE_DEFAULT);
//	lv_obj_set_style_text_color(label, lv_color_white(), LV_STATE_DEFAULT);
//
//	label = lv_label_create(battery);
//	lv_label_set_text_fmt(label, "Battery\ntemp.");
//	lv_obj_set_align(label, LV_ALIGN_CENTER);
//	lv_obj_set_style_text_align(label, LV_TEXT_ALIGN_CENTER, 0);
//	lv_obj_align(label, LV_ALIGN_BOTTOM_MID, 0, 0);
//	lv_obj_set_style_text_font(label, &lv_font_montserrat_28, LV_STATE_DEFAULT);
//	lv_obj_set_style_text_color(label, lv_color_white(), LV_STATE_DEFAULT);

//return dv;
}

static lv_obj_t* lv_settings_create(lv_obj_t *parent) {
	lv_obj_t *settings = lv_obj_create(parent);
	lv_obj_set_style_bg_color(dashboard, USER_COLOR_GRAY, LV_STATE_DEFAULT);
	lv_obj_set_size(settings, LV_HOR_RES, LV_VER_RES);

	return settings;
}

static lv_obj_t* lv_mode_select_create(lv_obj_t *parent) {
	lv_obj_t *mode_select = lv_obj_create(parent);

	lv_obj_t *label;

	static lv_style_t style_mode_button_marked;
	lv_style_init(&style_mode_button_marked);
	lv_style_set_text_color(&style_mode_button_marked, lv_color_white());
	lv_style_set_text_font(&style_mode_button_marked, &lv_font_montserrat_48);
	lv_style_set_text_align(&style_mode_button_marked, LV_TEXT_ALIGN_CENTER);
	lv_style_set_bg_color(&style_mode_button_marked, USER_COLOR_GREEN);

	static lv_style_t style_mode_button_unmarked;
	lv_style_init(&style_mode_button_unmarked);
	lv_style_set_text_color(&style_mode_button_unmarked, lv_color_white());
	lv_style_set_text_font(&style_mode_button_unmarked, &lv_font_montserrat_48);
	lv_style_set_text_align(&style_mode_button_unmarked, LV_TEXT_ALIGN_CENTER);
	lv_style_set_bg_color(&style_mode_button_unmarked, USER_COLOR_LIGHT_GRAY);

	manual_mode_btn = lv_btn_create(mode_select);
	lv_obj_add_event_cb(manual_mode_btn, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(manual_mode_btn, LV_ALIGN_CENTER, 0, -118);
	lv_obj_add_flag(manual_mode_btn, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_add_style(manual_mode_btn, &style_mode_button_marked, LV_STATE_CHECKED);
	lv_obj_add_style(manual_mode_btn, &style_mode_button_unmarked, LV_STATE_DEFAULT);
	lv_obj_set_height(manual_mode_btn, 225);
	lv_obj_set_width(manual_mode_btn, 780);

	label = lv_label_create(manual_mode_btn);
	lv_label_set_text(label, "Manual mode");
	lv_obj_set_style_text_font(label, &lv_font_montserrat_48, LV_PART_MAIN);
	lv_obj_center(label);

	dv_mode_btn = lv_btn_create(mode_select);
	lv_obj_add_event_cb(dv_mode_btn, event_handler, LV_EVENT_ALL, NULL);
	lv_obj_align(dv_mode_btn, LV_ALIGN_CENTER, 0, 118);
	lv_obj_add_flag(dv_mode_btn, LV_OBJ_FLAG_CHECKABLE);
	lv_obj_add_style(dv_mode_btn, &style_mode_button_marked, LV_STATE_CHECKED);
		lv_obj_add_style(dv_mode_btn, &style_mode_button_unmarked, LV_STATE_DEFAULT);
	lv_obj_set_height(dv_mode_btn, 225);
	lv_obj_set_width(dv_mode_btn, 780);

	label = lv_label_create(dv_mode_btn);
	lv_label_set_text(label, "Driverless mode");
	lv_obj_set_style_text_font(label, &lv_font_montserrat_48, LV_PART_MAIN);
	lv_obj_center(label);

	return mode_select;

}

static lv_obj_t* add_dv_tile(lv_obj_t *parent, lv_coord_t x, lv_coord_t y,
		lv_coord_t w, lv_coord_t h, lv_color_t bg_color) {
	lv_obj_t *tile = lv_btn_create(parent);

	lv_obj_set_pos(tile, x, y); /*Set its position*/
	lv_obj_set_size(tile, w, h); /*Set its size*/
	lv_obj_set_style_radius(tile, 25, LV_PART_MAIN);

	lv_obj_set_style_bg_color(tile, bg_color, LV_PART_MAIN);

	lv_obj_set_style_shadow_width(tile, 0, LV_PART_MAIN);
	lv_obj_set_style_border_width(tile, 0, LV_STATE_DEFAULT);

	return tile;
}
