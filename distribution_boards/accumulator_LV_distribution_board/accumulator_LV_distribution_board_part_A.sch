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
	2350 2400 2750 2400
Wire Wire Line
	2350 2600 3700 2600
Wire Wire Line
	2350 2700 3700 2700
Wire Wire Line
	2350 2800 3700 2800
Wire Wire Line
	2350 2900 3700 2900
Wire Wire Line
	3700 3000 2350 3000
Wire Wire Line
	3700 3100 2350 3100
Wire Wire Line
	2350 3200 3700 3200
Wire Wire Line
	2350 3300 3700 3300
Wire Wire Line
	2350 3400 3700 3400
Wire Wire Line
	2350 3500 3700 3500
Wire Wire Line
	2350 3600 3700 3600
Wire Wire Line
	2350 3700 3150 3700
Text Label 3350 2400 2    50   ~ 0
+24V
Text Label 3350 2500 2    50   ~ 0
SC_BSPD_IMD
Text Label 3350 2800 2    50   ~ 0
CAN1_H
Text Label 3350 3500 2    50   ~ 0
TS_state_accumulator+
Text Label 3350 4200 2    50   ~ 0
GND
Text Label 3350 2600 2    50   ~ 0
SC_TSMS_precharge
Text Label 3350 2900 2    50   ~ 0
CAN1_L
Text Label 3350 3000 2    50   ~ 0
CAN2_H
Text Label 3350 3100 2    50   ~ 0
CAN2_L
Text Label 3350 3200 2    50   ~ 0
SC_AMS_TBD
Text Label 3350 3300 2    50   ~ 0
relays_open+
Text Label 3350 3400 2    50   ~ 0
relays_open-
Wire Wire Line
	2350 2500 3700 2500
Text Label 3350 2700 2    50   ~ 0
reset
$Comp
L Connector:Conn_01x19_Male J1
U 1 1 5F67507C
P 2150 3300
F 0 "J1" H 2258 4381 50  0000 C CNN
F 1 "Conn_01x19_Male" H 2258 4290 50  0000 C CNN
F 2 "KTHFS:HEN.2F.319" H 2150 3300 50  0001 C CNN
F 3 "~" H 2150 3300 50  0001 C CNN
	1    2150 3300
	1    0    0    -1  
$EndComp
Text Label 3350 3600 2    50   ~ 0
TS_state_accumulator-
$Comp
L Mechanical:MountingHole_Pad H1
U 1 1 5F682113
P 3200 6750
F 0 "H1" V 3154 6900 50  0000 L CNN
F 1 "MountingHole_Pad" V 3245 6900 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 3200 6750 50  0001 C CNN
F 3 "~" H 3200 6750 50  0001 C CNN
	1    3200 6750
	0    1    1    0   
$EndComp
$Comp
L Mechanical:MountingHole_Pad H2
U 1 1 5F683118
P 3200 6950
F 0 "H2" V 3154 7100 50  0000 L CNN
F 1 "MountingHole_Pad" V 3245 7100 50  0000 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3_Pad_Via" H 3200 6950 50  0001 C CNN
F 3 "~" H 3200 6950 50  0001 C CNN
	1    3200 6950
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 4500 3150 4500
Wire Wire Line
	3250 4600 3050 4600
Wire Wire Line
	3050 3800 2350 3800
Wire Wire Line
	3250 4700 2950 4700
Wire Wire Line
	2950 3900 2350 3900
Wire Wire Line
	3500 4200 2850 4200
Wire Wire Line
	2900 2050 2750 2050
Wire Wire Line
	2750 2050 2750 2400
Connection ~ 2750 2400
Wire Wire Line
	2750 2400 3700 2400
Connection ~ 2850 4200
Wire Wire Line
	2850 4200 2350 4200
Text Label 2400 3700 0    50   ~ 0
AUX1
Text Label 2400 3800 0    50   ~ 0
AUX2
Text Label 2400 3900 0    50   ~ 0
AUX3
Wire Wire Line
	3100 6750 2950 6750
Wire Wire Line
	2950 6750 2950 6950
Wire Wire Line
	3100 6950 2950 6950
Text Label 2950 6750 0    50   ~ 0
GND
$Comp
L Connector:TestPoint TP2
U 1 1 5F6C7D41
P 3250 4500
F 0 "TP2" V 3250 4688 50  0000 L CNN
F 1 "TestPoint" V 3295 4688 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3450 4500 50  0001 C CNN
F 3 "~" H 3450 4500 50  0001 C CNN
	1    3250 4500
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 5F6C920D
P 3250 4600
F 0 "TP3" V 3250 4788 50  0000 L CNN
F 1 "TestPoint" V 3295 4788 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3450 4600 50  0001 C CNN
F 3 "~" H 3450 4600 50  0001 C CNN
	1    3250 4600
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 5F6C96E7
P 3250 4700
F 0 "TP4" V 3250 4888 50  0000 L CNN
F 1 "TestPoint" V 3295 4888 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3450 4700 50  0001 C CNN
F 3 "~" H 3450 4700 50  0001 C CNN
	1    3250 4700
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP1
U 1 1 5F6C9D35
P 2900 2050
F 0 "TP1" V 2900 2238 50  0000 L CNN
F 1 "TestPoint" V 2945 2238 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_1.0x1.0mm_Drill0.5mm" H 3100 2050 50  0001 C CNN
F 3 "~" H 3100 2050 50  0001 C CNN
	1    2900 2050
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 5F6E33EA
P 3300 6000
F 0 "TP6" V 3300 6188 50  0000 L CNN
F 1 "TestPoint" V 3345 6188 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3500 6000 50  0001 C CNN
F 3 "~" H 3500 6000 50  0001 C CNN
	1    3300 6000
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 5F6E33F0
P 3300 6100
F 0 "TP7" V 3300 6288 50  0000 L CNN
F 1 "TestPoint" V 3345 6288 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3500 6100 50  0001 C CNN
F 3 "~" H 3500 6100 50  0001 C CNN
	1    3300 6100
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 5F6E33F6
P 3300 6200
F 0 "TP8" V 3300 6388 50  0000 L CNN
F 1 "TestPoint" V 3345 6388 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3500 6200 50  0001 C CNN
F 3 "~" H 3500 6200 50  0001 C CNN
	1    3300 6200
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 5F6E33FC
P 3300 6300
F 0 "TP9" V 3300 6488 50  0000 L CNN
F 1 "TestPoint" V 3345 6488 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3500 6300 50  0001 C CNN
F 3 "~" H 3500 6300 50  0001 C CNN
	1    3300 6300
	0    1    1    0   
$EndComp
Wire Wire Line
	2900 6000 3300 6000
Wire Wire Line
	3300 6100 2900 6100
Wire Wire Line
	3300 6200 2900 6200
Wire Wire Line
	3300 6300 2900 6300
Text Label 2900 6000 0    50   ~ 0
CAN1_H
Text Label 2900 6100 0    50   ~ 0
CAN1_L
Text Label 2900 6200 0    50   ~ 0
CAN2_H
Text Label 2900 6300 0    50   ~ 0
CAN2_L
Text Notes 4050 2850 3    50   ~ 0
90 degree angle
$Comp
L Connector:TestPoint TP5
U 1 1 5F6C3917
P 3250 4800
F 0 "TP5" V 3250 4988 50  0000 L CNN
F 1 "TestPoint" V 3295 4988 50  0001 L CNN
F 2 "TestPoint:TestPoint_THTPad_D1.0mm_Drill0.5mm" H 3450 4800 50  0001 C CNN
F 3 "~" H 3450 4800 50  0001 C CNN
	1    3250 4800
	0    1    1    0   
$EndComp
Wire Wire Line
	3250 4800 2850 4800
Wire Wire Line
	2850 4200 2850 4800
Text Label 2800 4000 2    50   ~ 0
supply_fans
Text Label 2800 4100 2    50   ~ 0
GND_fans
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5F75E23D
P 3400 5350
F 0 "J2" H 3372 5324 50  0000 R CNN
F 1 "Conn_01x02_Male" H 3372 5233 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC3_angle_2" H 3400 5350 50  0001 C CNN
F 3 "~" H 3400 5350 50  0001 C CNN
	1    3400 5350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2950 3900 2950 4700
Text Label 2650 5350 0    50   ~ 0
supply_fans
Text Label 2650 5450 0    50   ~ 0
GND_fans
Wire Wire Line
	2650 5350 3200 5350
Wire Wire Line
	2650 5450 3200 5450
$Comp
L Connector:Conn_01x18_Male J3
U 1 1 5F780729
P 3900 3200
F 0 "J3" H 4008 4181 50  0000 C CNN
F 1 "Conn_01x18_Male" H 4008 4090 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x18_P2.54mm_Horizontal" H 3900 3200 50  0001 C CNN
F 3 "~" H 3900 3200 50  0001 C CNN
	1    3900 3200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3700 4100 3500 4100
Wire Wire Line
	3500 4100 3500 4200
Wire Wire Line
	3150 3700 3150 4500
Wire Wire Line
	3050 3800 3050 4600
Wire Wire Line
	3150 3700 3700 3700
Connection ~ 3150 3700
Wire Wire Line
	3250 4000 3250 3900
Wire Wire Line
	3250 3900 3700 3900
Wire Wire Line
	2350 4000 3250 4000
Wire Wire Line
	3350 4100 3350 4000
Wire Wire Line
	3350 4000 3700 4000
Wire Wire Line
	2350 4100 3350 4100
Wire Wire Line
	3250 3800 3700 3800
Text Label 3250 3800 0    50   ~ 0
enable_fans
$EndSCHEMATC
