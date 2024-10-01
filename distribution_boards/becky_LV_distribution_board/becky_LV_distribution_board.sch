EESchema Schematic File Version 4
LIBS:becky_LV_distribution_board-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev "1.0"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x06_Male J2
U 1 1 60C91740
P 5475 1450
F 0 "J2" H 5447 1424 50  0000 R CNN
F 1 "Conn_01x06_Male" H 5447 1333 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_6" H 5475 1450 50  0001 C CNN
F 3 "~" H 5475 1450 50  0001 C CNN
	1    5475 1450
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J4
U 1 1 60C92203
P 5475 2600
F 0 "J4" H 5447 2574 50  0000 R CNN
F 1 "Conn_01x04_Male" H 5447 2483 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_angle_4" H 5475 2600 50  0001 C CNN
F 3 "~" H 5475 2600 50  0001 C CNN
	1    5475 2600
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J6
U 1 1 60C9322A
P 5475 3350
F 0 "J6" H 5447 3324 50  0000 R CNN
F 1 "Conn_01x04_Male" H 5447 3233 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_angle_4" H 5475 3350 50  0001 C CNN
F 3 "~" H 5475 3350 50  0001 C CNN
	1    5475 3350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J3
U 1 1 60C93605
P 5475 2100
F 0 "J3" H 5447 2074 50  0000 R CNN
F 1 "Conn_01x04_Male" H 5447 1983 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_angle_4" H 5475 2100 50  0001 C CNN
F 3 "~" H 5475 2100 50  0001 C CNN
	1    5475 2100
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 60C9BCFA
P 5475 3000
F 0 "J5" H 5447 2974 50  0000 R CNN
F 1 "Conn_01x02_Male" H 5447 2883 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 5475 3000 50  0001 C CNN
F 3 "~" H 5475 3000 50  0001 C CNN
	1    5475 3000
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 60C9ECDB
P 5475 6500
F 0 "J9" H 5447 6474 50  0000 R CNN
F 1 "Conn_01x02_Male" H 5447 6383 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 5475 6500 50  0001 C CNN
F 3 "~" H 5475 6500 50  0001 C CNN
	1    5475 6500
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x10_Female J7
U 1 1 60CA4B2B
P 5475 4150
F 0 "J7" H 5503 4126 50  0000 L CNN
F 1 "Conn_01x10_Female" H 5503 4035 50  0000 L CNN
F 2 "KTHFS:Wurth-MM_female_10" H 5475 4150 50  0001 C CNN
F 3 "~" H 5475 4150 50  0001 C CNN
	1    5475 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x16_Female J8
U 1 1 60CA74BE
P 5475 5575
F 0 "J8" H 5503 5551 50  0000 L CNN
F 1 "Conn_01x16_Female" H 5503 5460 50  0000 L CNN
F 2 "KTHFS:Wurth-MM_female_16" H 5475 5575 50  0001 C CNN
F 3 "~" H 5475 5575 50  0001 C CNN
	1    5475 5575
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2950 3175 2950
Text Label 3175 2950 2    50   ~ 0
SC_TSMS_relays
Wire Wire Line
	3200 4150 2250 4150
Wire Wire Line
	3200 3850 2250 3850
NoConn ~ 2250 4250
Wire Wire Line
	3175 3950 2250 3950
Wire Wire Line
	2250 4450 3175 4450
Wire Wire Line
	3175 3750 2250 3750
Wire Wire Line
	3175 3650 2250 3650
Wire Wire Line
	2250 3550 3175 3550
Wire Wire Line
	3175 3450 2250 3450
Wire Wire Line
	2250 3350 3175 3350
Wire Wire Line
	3175 3250 2250 3250
Wire Wire Line
	2250 3150 3175 3150
Wire Wire Line
	3175 3050 2250 3050
Wire Wire Line
	3175 2850 2250 2850
Wire Wire Line
	3175 2750 2250 2750
Text Label 3200 4150 2    50   ~ 0
SC_GND
Text Label 3175 3950 2    50   ~ 0
TS_state_accumulator-
Text Label 3175 4450 2    50   ~ 0
TS_state_accumulator+
Text Label 3175 3050 2    50   ~ 0
SC_right_AMS
Text Label 3175 3750 2    50   ~ 0
relays_open-
Text Label 3175 3650 2    50   ~ 0
relays_open+
Text Label 3175 3550 2    50   ~ 0
RST_out
Text Label 3175 3450 2    50   ~ 0
CAN2_L
Text Label 3175 3350 2    50   ~ 0
CAN2_H
Text Label 3175 3250 2    50   ~ 0
CAN1_L
Text Label 3175 3150 2    50   ~ 0
CAN1_H
Text Label 3200 4050 2    50   ~ 0
cooling_GND
Text Label 3175 2850 2    50   ~ 0
cooling_supply
Text Label 3200 3850 2    50   ~ 0
control_systems_GND
Text Label 3175 2750 2    50   ~ 0
control_systems_supply
$Comp
L Connector:Conn_01x19_Female J1
U 1 1 60CA0649
P 2050 3650
F 0 "J1" H 2078 3676 50  0000 L CNN
F 1 "Conn_01x19_Female" H 2078 3585 50  0000 L CNN
F 2 "KTHFS:HEN.2F.319" H 2050 3650 50  0001 C CNN
F 3 "~" H 2050 3650 50  0001 C CNN
	1    2050 3650
	-1   0    0    -1  
$EndComp
Text Label 4325 1250 0    50   ~ 0
control_systems_supply
Wire Wire Line
	4325 1350 5275 1350
Text Label 4325 1350 0    50   ~ 0
control_systems_GND
Wire Wire Line
	5275 1250 4325 1250
Text Label 4325 1450 0    50   ~ 0
CAN2_L
Text Label 4325 1550 0    50   ~ 0
CAN2_H
Wire Wire Line
	4325 1450 5275 1450
Wire Wire Line
	4325 1550 5275 1550
Text Label 4325 1650 0    50   ~ 0
OCS
Text Label 4325 1750 0    50   ~ 0
Trigger
Wire Wire Line
	4325 1650 5275 1650
Wire Wire Line
	5275 1750 4325 1750
Text Label 4325 2000 0    50   ~ 0
control_systems_supply
Wire Wire Line
	4325 2100 5275 2100
Text Label 4325 2100 0    50   ~ 0
control_systems_GND
Wire Wire Line
	5275 2000 4325 2000
Text Label 4325 2300 0    50   ~ 0
CAN2_L
Text Label 4325 2200 0    50   ~ 0
CAN2_H
Wire Wire Line
	4325 2200 5275 2200
Wire Wire Line
	4325 2300 5275 2300
Text Label 4325 2500 0    50   ~ 0
control_systems_supply
Wire Wire Line
	5275 2500 4325 2500
Wire Wire Line
	4325 2800 5275 2800
Text Label 4325 2800 0    50   ~ 0
control_systems_GND
Text Label 4325 2600 0    50   ~ 0
TS_state_accumulator+
Text Label 4325 2700 0    50   ~ 0
TS_state_accumulator-
Wire Wire Line
	5275 2600 4325 2600
Wire Wire Line
	4325 2700 5275 2700
Text Label 4325 3000 0    50   ~ 0
SC_IMD_HV_connector
Wire Wire Line
	5275 3000 4325 3000
NoConn ~ 5275 3100
Text Label 4325 3350 0    50   ~ 0
SC_TSMS_relays
Wire Wire Line
	4325 3450 5275 3450
Text Label 4325 3450 0    50   ~ 0
SC_GND
Wire Wire Line
	5275 3350 4325 3350
Text Label 4325 3250 0    50   ~ 0
enable_precharge
Wire Wire Line
	5275 3250 4325 3250
NoConn ~ 5275 3550
Text Label 4325 3750 0    50   ~ 0
control_systems_supply
Wire Wire Line
	5275 3750 4325 3750
Wire Wire Line
	4325 4550 5275 4550
Text Label 4325 4550 0    50   ~ 0
control_systems_GND
NoConn ~ 5275 4650
Text Label 4325 3850 0    50   ~ 0
enable_AIR+
Text Label 4325 3950 0    50   ~ 0
enable_AIR-
Text Label 4325 4050 0    50   ~ 0
AIR+_closed
Text Label 4325 4150 0    50   ~ 0
AIR-_closed
Wire Wire Line
	4325 3850 5275 3850
Wire Wire Line
	5275 3950 4325 3950
Wire Wire Line
	4325 4050 5275 4050
Wire Wire Line
	5275 4150 4325 4150
Text Label 4325 4250 0    50   ~ 0
precharge_closed
Wire Wire Line
	4325 4250 5275 4250
Text Label 4325 4350 0    50   ~ 0
relays_open+
Text Label 4325 4450 0    50   ~ 0
relays_open-
Wire Wire Line
	4325 4350 5275 4350
Wire Wire Line
	5275 4450 4325 4450
Text Label 4350 6600 0    50   ~ 0
cooling_GND
Text Label 4350 6500 0    50   ~ 0
cooling_supply
Wire Wire Line
	4350 4875 5275 4875
Text Label 4350 4875 0    50   ~ 0
control_systems_supply
Text Label 4350 6375 0    50   ~ 0
control_systems_GND
Wire Wire Line
	4350 5275 5275 5275
Wire Wire Line
	5275 5175 4350 5175
Wire Wire Line
	4350 5075 5275 5075
Wire Wire Line
	5275 4975 4350 4975
Text Label 4350 5275 0    50   ~ 0
CAN2_L
Text Label 4350 5175 0    50   ~ 0
CAN2_H
Text Label 4350 5075 0    50   ~ 0
CAN1_L
Text Label 4350 4975 0    50   ~ 0
CAN1_H
Text Label 4350 5375 0    50   ~ 0
RST_out
Wire Wire Line
	5275 5375 4350 5375
Text Label 4350 5475 0    50   ~ 0
AIR+_closed
Text Label 4350 5575 0    50   ~ 0
AIR-_closed
Wire Wire Line
	5275 5475 4350 5475
Wire Wire Line
	4350 5575 5275 5575
Text Label 4350 5675 0    50   ~ 0
precharge_closed
Wire Wire Line
	5275 5675 4350 5675
Text Label 4350 5775 0    50   ~ 0
enable_AIR+
Text Label 4350 5875 0    50   ~ 0
enable_AIR-
Wire Wire Line
	5275 5775 4350 5775
Wire Wire Line
	4350 5875 5275 5875
Text Label 4350 5975 0    50   ~ 0
enable_precharge
Wire Wire Line
	5275 5975 4350 5975
Text Label 4350 6075 0    50   ~ 0
SC_right_AMS
Text Label 4350 6175 0    50   ~ 0
SC_IMD_HV_connector
Wire Wire Line
	4350 6075 5275 6075
Wire Wire Line
	5275 6175 4350 6175
Wire Wire Line
	4350 6375 5275 6375
Wire Wire Line
	5275 6500 4350 6500
Wire Wire Line
	4350 6600 5275 6600
Text Label 4350 6275 0    50   ~ 0
SC_TSMS_relays
Wire Wire Line
	4350 6275 5275 6275
NoConn ~ 5275 1650
NoConn ~ 5275 1750
NoConn ~ -3700 2475
Wire Wire Line
	2250 4050 3200 4050
NoConn ~ 2250 4350
NoConn ~ 2250 4550
$EndSCHEMATC
