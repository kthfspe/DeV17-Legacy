EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Wire Wire Line
	4300 2400 5300 2400
Wire Wire Line
	4300 2600 5300 2600
Wire Wire Line
	4300 2700 5300 2700
Wire Wire Line
	4300 2800 5300 2800
Wire Wire Line
	4300 2900 5300 2900
Wire Wire Line
	5300 3000 4300 3000
Wire Wire Line
	5300 3100 4300 3100
Wire Wire Line
	4300 3200 5300 3200
Wire Wire Line
	4300 3300 5300 3300
Wire Wire Line
	4300 3400 5300 3400
Wire Wire Line
	4300 3500 5300 3500
Wire Wire Line
	4300 3600 5300 3600
Wire Wire Line
	5300 3700 4300 3700
Wire Wire Line
	5300 3800 4300 3800
Text Label 5300 2400 2    50   ~ 0
+24V
Text Label 5300 2500 2    50   ~ 0
SC_BSPD_IMD
Text Label 5300 2800 2    50   ~ 0
CAN1_H
Text Label 5300 3500 2    50   ~ 0
TS_state_accumulator+
Text Label 5300 4100 2    50   ~ 0
GND
Text Label 5300 2600 2    50   ~ 0
SC_TSMS_precharge
Text Label 5300 2900 2    50   ~ 0
CAN1_L
Text Label 5300 3000 2    50   ~ 0
CAN2_H
Text Label 5300 3100 2    50   ~ 0
CAN2_L
Text Label 5300 3200 2    50   ~ 0
SC_AMS_TBD
Text Label 5300 3300 2    50   ~ 0
relays_open+
Text Label 5300 3400 2    50   ~ 0
relays_open-
Wire Wire Line
	6300 1000 5650 1000
Wire Wire Line
	6300 1100 5650 1100
Wire Wire Line
	6300 1300 5650 1300
Wire Wire Line
	6300 1400 5650 1400
Wire Wire Line
	6300 1500 5650 1500
Wire Wire Line
	6750 1000 7500 1000
Wire Wire Line
	7400 2800 8400 2800
Wire Wire Line
	7400 3000 8400 3000
Wire Wire Line
	7400 3100 8400 3100
Wire Wire Line
	7400 3200 8400 3200
Wire Wire Line
	7400 3500 8400 3500
Wire Wire Line
	7400 3600 8400 3600
Wire Wire Line
	7400 4200 8400 4200
Wire Wire Line
	7400 4500 8400 4500
Wire Wire Line
	6300 900  5650 900 
Text Label 6300 1000 2    50   ~ 0
enable_AIR-
Text Label 6300 1100 2    50   ~ 0
enable_precharge
Text Label 6300 1300 2    50   ~ 0
relays_open
Text Label 6300 1400 2    50   ~ 0
relays_open+
Text Label 6300 1500 2    50   ~ 0
relays_open-
Text Label 6750 1000 0    50   ~ 0
SC_TSMS_precharge
$Comp
L Connector:Conn_01x06_Male J5
U 1 1 5E9671BA
P 8600 2250
F 0 "J5" H 8572 2224 50  0000 R CNN
F 1 "Conn_01x06_Male" H 8572 2133 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-06A_1x06_P2.54mm_Vertical" H 8600 2250 50  0001 C CNN
F 3 "~" H 8600 2250 50  0001 C CNN
	1    8600 2250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7400 2050 8400 2050
Wire Wire Line
	7400 2150 8400 2150
Wire Wire Line
	7400 2250 8400 2250
Wire Wire Line
	7400 2350 8400 2350
Wire Wire Line
	7400 2450 8400 2450
Wire Wire Line
	7400 2550 8400 2550
Text Label 7400 2050 0    50   ~ 0
+24V
Text Label 7400 2150 0    50   ~ 0
GND
Text Label 7400 2250 0    50   ~ 0
CAN1_L
Text Label 7400 2350 0    50   ~ 0
CAN1_H
Text Label 7400 2450 0    50   ~ 0
OCS
Text Label 7400 2550 0    50   ~ 0
Trigger
Text Label 7400 2800 0    50   ~ 0
+24V
Text Label 7400 3000 0    50   ~ 0
SC_BSPD_IMD
Text Label 7400 3100 0    50   ~ 0
SC_TSMS_precharge
Text Label 7400 3200 0    50   ~ 0
AIR+_closed
Text Label 7400 3500 0    50   ~ 0
CAN1_H
Text Label 7400 3600 0    50   ~ 0
CAN1_L
Text Label 7400 4200 0    50   ~ 0
SC_AMS_TBD
Wire Wire Line
	7400 4800 8400 4800
Wire Wire Line
	7400 4900 8400 4900
Wire Wire Line
	7400 5000 8400 5000
Wire Wire Line
	7400 5100 8400 5100
Text Label 7400 4800 0    50   ~ 0
+24V
Text Label 7400 5100 0    50   ~ 0
GND
$Comp
L Connector:Conn_01x04_Male J7
U 1 1 5E992703
P 8600 4900
F 0 "J7" H 8572 4874 50  0000 R CNN
F 1 "Conn_01x04_Male" H 8572 4783 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-04A_1x04_P2.54mm_Vertical" H 8600 4900 50  0001 C CNN
F 3 "~" H 8600 4900 50  0001 C CNN
	1    8600 4900
	-1   0    0    -1  
$EndComp
NoConn ~ 7400 2450
NoConn ~ 7400 2550
Wire Wire Line
	7400 2900 8400 2900
Wire Wire Line
	7400 3700 8400 3700
Wire Wire Line
	7400 3800 8400 3800
Text Label 7400 3700 0    50   ~ 0
CAN2_H
Text Label 7400 3800 0    50   ~ 0
CAN2_L
Wire Wire Line
	4300 2500 5300 2500
Text Label 5300 2700 2    50   ~ 0
reset
Wire Wire Line
	5300 4100 4300 4100
Text Label 6300 900  2    50   ~ 0
enable_AIR+
Text Label 7400 4500 0    50   ~ 0
GND
Text Label 7400 2900 0    50   ~ 0
reset
Wire Wire Line
	7400 3900 8400 3900
Wire Wire Line
	7400 4000 8400 4000
Wire Wire Line
	7400 4100 8400 4100
Text Label 7400 3900 0    50   ~ 0
enable_AIR+
Text Label 7400 4000 0    50   ~ 0
enable_AIR-
Text Label 7400 4100 0    50   ~ 0
enable_precharge
Text Label 5300 3600 2    50   ~ 0
TS_state_accumulator-
Text Label 7400 4900 0    50   ~ 0
TS_state_accumulator+
Text Label 7400 5000 0    50   ~ 0
TS_state_accumulator-
Wire Wire Line
	7500 1100 6750 1100
Text Label 6750 1100 0    50   ~ 0
GND
Text Notes 4000 2850 3    50   ~ 0
90 degree angle
Wire Wire Line
	7500 900  6750 900 
Text Label 6750 900  0    50   ~ 0
+24V
Wire Notes Line
	4700 650  8500 650 
Wire Notes Line
	8500 650  8500 1800
Wire Notes Line
	8500 1800 4700 1800
Wire Notes Line
	4700 1800 4700 650 
Text Notes 4700 650  0    50   ~ 0
relay_monitor footprint (precharge_and_AIRs_driver stacked on top)
Text Notes 8650 2200 0    50   ~ 0
to IVT
Text Notes 8650 3850 0    50   ~ 0
AMS_master
Text Notes 8650 4850 0    50   ~ 0
to HV_sensor
Text Label 7150 1400 0    50   ~ 0
GND
Wire Wire Line
	7500 1400 7150 1400
Wire Wire Line
	7500 1500 7150 1500
Wire Wire Line
	7150 1500 7150 1400
Text Label 4800 6750 0    50   ~ 0
GND
Wire Wire Line
	4800 7150 4800 7350
Wire Wire Line
	4950 7150 4800 7150
Connection ~ 4800 7150
Wire Wire Line
	4800 6950 4800 7150
Wire Wire Line
	4950 6950 4800 6950
Wire Wire Line
	4800 7350 4950 7350
Connection ~ 4800 6950
Wire Wire Line
	4800 6750 4800 6950
Wire Wire Line
	4950 6750 4800 6750
$Comp
L Mechanical:MountingHole_Pad H4
U 1 1 5F6A3F24
P 5050 7350
F 0 "H4" V 5004 7500 50  0000 L CNN
F 1 "MountingHole_Pad" V 5095 7500 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5050 7350 50  0001 C CNN
F 3 "~" H 5050 7350 50  0001 C CNN
	1    5050 7350
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H3
U 1 1 5F6833F4
P 5050 7150
F 0 "H3" V 5004 7300 50  0000 L CNN
F 1 "MountingHole_Pad" V 5095 7300 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5050 7150 50  0001 C CNN
F 3 "~" H 5050 7150 50  0001 C CNN
	1    5050 7150
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F683118
P 5050 6950
F 0 "H2" V 5004 7100 50  0000 L CNN
F 1 "MountingHole_Pad" V 5095 7100 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5050 6950 50  0001 C CNN
F 3 "~" H 5050 6950 50  0001 C CNN
	1    5050 6950
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5F682113
P 5050 6750
F 0 "H1" V 5004 6900 50  0000 L CNN
F 1 "MountingHole_Pad" V 5095 6900 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 5050 6750 50  0001 C CNN
F 3 "~" H 5050 6750 50  0001 C CNN
	1    5050 6750
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x02_Female J11
U 1 1 5F669597
P 7700 1400
F 0 "J11" H 7728 1376 50  0000 L CNN
F 1 "Conn_01x02_Female" H 7728 1285 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 7700 1400 50  0001 C CNN
F 3 "~" H 7700 1400 50  0001 C CNN
	1    7700 1400
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J2
U 1 1 5F66EB02
P 5450 1000
F 0 "J2" H 5342 1285 50  0000 C CNN
F 1 "Conn_01x03_Female" H 5342 1194 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 5450 1000 50  0001 C CNN
F 3 "~" H 5450 1000 50  0001 C CNN
	1    5450 1000
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J3
U 1 1 5F6718C5
P 5450 1400
F 0 "J3" H 5342 1685 50  0000 C CNN
F 1 "Conn_01x03_Female" H 5342 1594 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 5450 1400 50  0001 C CNN
F 3 "~" H 5450 1400 50  0001 C CNN
	1    5450 1400
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Female J4
U 1 1 5F6725A1
P 7700 1000
F 0 "J4" H 7728 1026 50  0000 L CNN
F 1 "Conn_01x03_Female" H 7728 935 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 7700 1000 50  0001 C CNN
F 3 "~" H 7700 1000 50  0001 C CNN
	1    7700 1000
	1    0    0    -1  
$EndComp
Text Label 5300 3700 2    50   ~ 0
AUX1
$Comp
L Connector:TestPoint TP1
U 1 1 5F6B676D
P 5300 3700
F 0 "TP1" V 5300 3888 50  0000 L CNN
F 1 "TestPoint" V 5345 3888 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 5500 3700 50  0001 C CNN
F 3 "~" H 5500 3700 50  0001 C CNN
	1    5300 3700
	0    1    1    0   
$EndComp
$Comp
L Connector:Conn_01x18_Female J1
U 1 1 5F75EB9E
P 4100 3200
F 0 "J1" H 3992 4185 50  0000 C CNN
F 1 "Conn_01x18_Female" H 3992 4094 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x18_P2.54mm_Vertical" H 4100 3200 50  0001 C CNN
F 3 "~" H 4100 3200 50  0001 C CNN
	1    4100 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4300 3900 5300 3900
Wire Wire Line
	4300 4000 5300 4000
Text Label 5300 3800 2    50   ~ 0
enable_fans
Text Label 5300 3900 2    50   ~ 0
supply_fans
Text Label 5300 4000 2    50   ~ 0
GND_fans
Text Label 7400 4400 0    50   ~ 0
AUX1
Wire Wire Line
	7400 4400 8400 4400
Text Label 7400 4300 0    50   ~ 0
enable_fans
Wire Wire Line
	7400 4300 8400 4300
$Comp
L Connector:Conn_01x18_Female J6
U 1 1 5F7EF512
P 8600 3600
F 0 "J6" H 8628 3576 50  0000 L CNN
F 1 "Conn_01x18_Female" H 8628 3485 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x09_P2.54mm_Vertical" H 8600 3600 50  0001 C CNN
F 3 "~" H 8600 3600 50  0001 C CNN
	1    8600 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 3300 8400 3300
Text Label 7400 3300 0    50   ~ 0
AIR-_closed
Wire Wire Line
	7400 3400 8400 3400
Text Label 7400 3400 0    50   ~ 0
precharge_closed
$EndSCHEMATC
