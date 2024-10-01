EESchema Schematic File Version 4
LIBS:inverter_box_LV_distribution_board-cache
EELAYER 30 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "inverter_box_LV_distribution_board"
Date ""
Rev ""
Comp ""
Comment1 "Dev17"
Comment2 "Emil Tagesson"
Comment3 "emil.tagesson1@gmail.com"
Comment4 ""
$EndDescr
Text Notes 4075 1125 0    89   ~ 0
Encoder cables
$Comp
L Connector:Conn_01x02_Male J25
U 1 1 6082A98C
P 2275 975
F 0 "J25" H 2247 857 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2247 948 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 2275 975 50  0001 C CNN
F 3 "~" H 2275 975 50  0001 C CNN
	1    2275 975 
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 6082B7D5
P 1550 7325
F 0 "J6" H 1522 7207 50  0000 R CNN
F 1 "Conn_01x02_Male" H 1522 7298 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 1550 7325 50  0001 C CNN
F 3 "~" H 1550 7325 50  0001 C CNN
	1    1550 7325
	-1   0    0    1   
$EndComp
Text Notes 1400 7625 0    63   ~ 0
SC_HV_connector_RL_motor
Text Notes 2925 7025 0    63   ~ 0
SC_TSMS_relays
$Comp
L Connector:Conn_01x03_Male J22
U 1 1 6082EC96
P 1950 10625
F 0 "J22" H 1922 10557 50  0000 R CNN
F 1 "Conn_01x03_Male" H 2600 10775 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 1950 10625 50  0001 C CNN
F 3 "~" H 1950 10625 50  0001 C CNN
	1    1950 10625
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J23
U 1 1 6082F4F3
P 3450 10625
F 0 "J23" H 3422 10557 50  0000 R CNN
F 1 "Conn_01x03_Male" H 4100 10775 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 3450 10625 50  0001 C CNN
F 3 "~" H 3450 10625 50  0001 C CNN
	1    3450 10625
	-1   0    0    1   
$EndComp
Text Notes 650  10275 0    89   ~ 0
CAN2 Inverters
Text Notes 650  2650 0    89   ~ 0
DATA logger supply and CAN1
$Comp
L Connector:Conn_01x04_Male J7
U 1 1 6083090A
P 2150 3225
F 0 "J7" H 2122 3107 50  0000 R CNN
F 1 "Conn_01x04_Male" H 2122 3198 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_4" H 2150 3225 50  0001 C CNN
F 3 "~" H 2150 3225 50  0001 C CNN
	1    2150 3225
	-1   0    0    1   
$EndComp
Text Notes 575  1325 0    90   ~ 0
Discharge resistor temperature
Text Notes 5600 1275 0    63   ~ 0
Rear Inverters
Text Notes 4125 1275 0    63   ~ 0
Front Inverters
Text Notes 650  6825 0    89   ~ 0
Shutdown Circuit
$Comp
L Device:R R1
U 1 1 6089FC4D
P 1400 2975
F 0 "R1" H 1470 3021 50  0000 L CNN
F 1 "120" H 1200 2975 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1330 2975 50  0001 C CNN
F 3 "~" H 1400 2975 50  0001 C CNN
	1    1400 2975
	1    0    0    -1  
$EndComp
Text Notes 700  9525 0    63   ~ 0
Front Inverters
Text Notes 4325 9575 0    63   ~ 0
Rear Inverters
Text Notes 750  8325 0    63   ~ 0
Front Inverters
Text Notes 1950 8325 0    63   ~ 0
Rear Inverters\n
Text Notes 650  8150 0    89   ~ 0
Motor temperature
$Comp
L Connector:Conn_01x02_Male J18
U 1 1 608258A3
P 2900 8575
F 0 "J18" H 2872 8457 50  0000 R CNN
F 1 "Conn_01x02_Male" H 3550 8650 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 2900 8575 50  0001 C CNN
F 3 "~" H 2900 8575 50  0001 C CNN
	1    2900 8575
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J19
U 1 1 6082541E
P 2850 9075
F 0 "J19" H 2822 8957 50  0000 R CNN
F 1 "Conn_01x02_Male" H 3500 9150 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 2850 9075 50  0001 C CNN
F 3 "~" H 2850 9075 50  0001 C CNN
	1    2850 9075
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J16
U 1 1 608251BA
P 1675 8575
F 0 "J16" H 1647 8457 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2325 8650 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 1675 8575 50  0001 C CNN
F 3 "~" H 1675 8575 50  0001 C CNN
	1    1675 8575
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x02_Male J17
U 1 1 60824553
P 1675 9075
F 0 "J17" H 1647 8957 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2325 9150 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 1675 9075 50  0001 C CNN
F 3 "~" H 1675 9075 50  0001 C CNN
	1    1675 9075
	-1   0    0    1   
$EndComp
Text Notes 650  9375 0    89   ~ 0
Enable inverters\n
$Comp
L Connector:Conn_01x02_Male J11
U 1 1 6097EE2E
P 1550 7825
F 0 "J11" H 1522 7707 50  0000 R CNN
F 1 "Conn_01x02_Male" H 1522 7798 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 1550 7825 50  0001 C CNN
F 3 "~" H 1550 7825 50  0001 C CNN
	1    1550 7825
	-1   0    0    1   
$EndComp
Text Notes 750  7050 0    63   ~ 0
SC_motor_interlock
Connection ~ 1400 2825
Connection ~ 1400 3125
Wire Wire Line
	1350 7825 1300 7825
Wire Wire Line
	1200 7825 1200 7325
Wire Wire Line
	1200 7325 1350 7325
$Comp
L Connector:Conn_01x02_Male J9
U 1 1 60A937DC
P 2275 1650
F 0 "J9" H 2247 1532 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2247 1623 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_2" H 2275 1650 50  0001 C CNN
F 3 "~" H 2275 1650 50  0001 C CNN
	1    2275 1650
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x04_Male J10
U 1 1 60ADC7C4
P 2125 2325
F 0 "J10" H 2097 2207 50  0000 R CNN
F 1 "Conn_01x04_Male" H 2097 2298 50  0000 R CNN
F 2 "KTHFS:Wurth-WTB_2.54_male_vert_4" H 2125 2325 50  0001 C CNN
F 3 "~" H 2125 2325 50  0001 C CNN
	1    2125 2325
	-1   0    0    1   
$EndComp
Text Notes 650  5750 0    85   ~ 0
Test_points
$Comp
L Connector:TestPoint TP1
U 1 1 608700BC
P 2075 6050
F 0 "TP1" H 2133 6168 50  0000 L CNN
F 1 "TestPoint" H 2133 6077 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.5mm_Drill1.2mm" H 2275 6050 50  0001 C CNN
F 3 "~" H 2275 6050 50  0001 C CNN
	1    2075 6050
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP3
U 1 1 60870B0E
P 2525 6150
F 0 "TP3" H 2583 6268 50  0000 L CNN
F 1 "TestPoint" H 2583 6177 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.5mm_Drill1.2mm" H 2725 6150 50  0001 C CNN
F 3 "~" H 2725 6150 50  0001 C CNN
	1    2525 6150
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP2
U 1 1 60871367
P 2075 6350
F 0 "TP2" H 2133 6468 50  0000 L CNN
F 1 "TestPoint" H 2133 6377 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.5mm_Drill1.2mm" H 2275 6350 50  0001 C CNN
F 3 "~" H 2275 6350 50  0001 C CNN
	1    2075 6350
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP4
U 1 1 6087176A
P 2525 6450
F 0 "TP4" H 2583 6568 50  0000 L CNN
F 1 "TestPoint" H 2583 6477 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.5mm_Drill1.2mm" H 2725 6450 50  0001 C CNN
F 3 "~" H 2725 6450 50  0001 C CNN
	1    2525 6450
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP5
U 1 1 60871AC2
P 2975 6550
F 0 "TP5" H 3033 6668 50  0000 L CNN
F 1 "TestPoint" H 3033 6577 50  0000 L CNN
F 2 "TestPoint:TestPoint_THTPad_D2.5mm_Drill1.2mm" H 3175 6550 50  0001 C CNN
F 3 "~" H 3175 6550 50  0001 C CNN
	1    2975 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	1400 3125 1950 3125
Wire Wire Line
	1800 2825 1800 3025
Wire Wire Line
	1800 3025 1950 3025
Wire Wire Line
	1400 2825 1800 2825
Wire Wire Line
	1350 7725 1300 7725
Wire Wire Line
	1300 7725 1300 7825
Connection ~ 1300 7825
Wire Wire Line
	1300 7825 1200 7825
$Comp
L Connector:Conn_01x03_Male J20
U 1 1 609B8065
P 2150 9725
F 0 "J20" H 2122 9657 50  0000 R CNN
F 1 "Conn_01x03_Male" H 2800 9900 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 2150 9725 50  0001 C CNN
F 3 "~" H 2150 9725 50  0001 C CNN
	1    2150 9725
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J21
U 1 1 609B8EE2
P 5775 9775
F 0 "J21" H 5747 9707 50  0000 R CNN
F 1 "Conn_01x03_Male" H 6425 9975 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 5775 9775 50  0001 C CNN
F 3 "~" H 5775 9775 50  0001 C CNN
	1    5775 9775
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J8
U 1 1 60BFC218
P 4300 7325
F 0 "J8" H 4272 7257 50  0000 R CNN
F 1 "Conn_01x03_Male" H 4950 7525 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 4300 7325 50  0001 C CNN
F 3 "~" H 4300 7325 50  0001 C CNN
	1    4300 7325
	-1   0    0    1   
$EndComp
Text Notes 650  3650 0    102  ~ 0
RF Possbile (x140)\n
$Comp
L Connector:Conn_01x03_Male J27
U 1 1 60C6EADC
P 1975 4350
F 0 "J27" H 1947 4282 50  0000 R CNN
F 1 "Conn_01x03_Male" H 1947 4373 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 1975 4350 50  0001 C CNN
F 3 "~" H 1975 4350 50  0001 C CNN
	1    1975 4350
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J28
U 1 1 60C70075
P 1975 4800
F 0 "J28" H 1947 4732 50  0000 R CNN
F 1 "Conn_01x03_Male" H 1947 4823 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 1975 4800 50  0001 C CNN
F 3 "~" H 1975 4800 50  0001 C CNN
	1    1975 4800
	-1   0    0    1   
$EndComp
$Comp
L Connector:Conn_01x03_Male J26
U 1 1 60C70628
P 1975 3950
F 0 "J26" H 1947 3882 50  0000 R CNN
F 1 "Conn_01x03_Male" H 1947 3973 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 1975 3950 50  0001 C CNN
F 3 "~" H 1975 3950 50  0001 C CNN
	1    1975 3950
	-1   0    0    1   
$EndComp
Wire Wire Line
	1725 4900 1775 4900
Wire Wire Line
	1725 4900 1725 4800
Wire Wire Line
	1725 4800 1775 4800
Text Notes 2725 4000 0    63   ~ 0
Front Left
Text Notes 2725 4400 0    63   ~ 0
Front right\n
Text Notes 2725 4825 0    63   ~ 0
Rear left
Text Notes 2725 5350 0    63   ~ 0
Rear right
Text Label 9250 4750 0    50   ~ 0
REAR_LEFT_KTY-
Text Label 9250 4850 0    50   ~ 0
REAR_LEFT_KTY+
Text Label 9250 4950 0    50   ~ 0
REAR_LEFT_DATA+
Text Label 9250 5050 0    50   ~ 0
REAR_LEFT_DATA-
Text Label 9250 5150 0    50   ~ 0
REAR_LEFT_GND
Wire Wire Line
	11400 5850 10675 5850
Wire Wire Line
	11400 5650 10675 5650
Text Label 10450 5450 0    50   ~ 0
FRONT_LEFT_UP_SUPPLY
Text Label 10450 5150 0    50   ~ 0
FRONT_LEFT_GND
Text Label 10450 5350 0    50   ~ 0
FRONT_LEFT_CLOCK+
Text Label 10450 5250 0    50   ~ 0
FRONT_LEFT_CLOCK-
Text Label 10450 5050 0    50   ~ 0
FRONT_LEFT_DATA-
Text Label 10450 4950 0    50   ~ 0
FRONT_LEFT_DATA+
Text Label 10450 4850 0    50   ~ 0
FRONT_LEFT_KTY+
Text Label 10450 4750 0    50   ~ 0
FRONT_LEFT_KTY-
Text Notes 9125 4475 0    50   ~ 0
Motor encoder Lemo-connector\nLemo needs to be grounded since the encoder cable needs to be grounded in both ends
Text Notes 9825 4650 2    50   ~ 0
Rear left motor\n
Text Notes 11050 4650 2    50   ~ 0
Front left motor
Wire Notes Line
	11650 4500 9125 4500
$Comp
L Connector:Conn_01x13_Female J3
U 1 1 633AB90C
P 10325 5350
F 0 "J3" H 10353 5330 50  0001 L CNN
F 1 "Conn_01x13_Female" H 10353 5285 50  0001 L CNN
F 2 "KTHFS:HEN.1F.308" H 10325 5350 50  0001 C CNN
F 3 "~" H 10325 5350 50  0001 C CNN
	1    10325 5350
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x13_Female J5
U 1 1 633AE8D3
P 11600 5350
F 0 "J5" H 11628 5330 50  0001 L CNN
F 1 "Conn_01x13_Female" H 11628 5285 50  0001 L CNN
F 2 "KTHFS:HEN.1F.308" H 11600 5350 50  0001 C CNN
F 3 "~" H 11600 5350 50  0001 C CNN
	1    11600 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 5850 10125 5850
Wire Wire Line
	9400 5650 10125 5650
NoConn ~ 10125 5550
NoConn ~ 11400 5550
Wire Wire Line
	9400 5750 10125 5750
Wire Wire Line
	9400 5950 10125 5950
Wire Wire Line
	11400 5950 10675 5950
Wire Wire Line
	11400 5750 10675 5750
Text Notes 9150 6050 0    50   ~ 0
PIN 9 not used for lemos
Wire Notes Line
	9125 6100 11650 6100
Wire Notes Line
	9125 4500 9125 6100
Wire Notes Line
	11650 4500 11650 6100
Text Notes 9275 1625 0    50   ~ 0
D_space, SC, LV Supply
Text Notes 9250 6550 0    50   ~ 0
Rigth rear motor\n
Text Notes 10975 6525 0    50   ~ 0
Rigth front motor\n
$Comp
L Connector:Conn_01x13_Female J30
U 1 1 633C885C
P 12200 7275
F 0 "J30" H 12228 7255 50  0001 L CNN
F 1 "Conn_01x13_Female" H 12228 7210 50  0001 L CNN
F 2 "KTHFS:HEN.1F.308" H 12200 7275 50  0001 C CNN
F 3 "~" H 12200 7275 50  0001 C CNN
	1    12200 7275
	1    0    0    -1  
$EndComp
NoConn ~ 12000 7475
Text Label 10975 6675 0    50   ~ 0
FRONT_RIGHT_KTY-
Text Label 10975 7075 0    50   ~ 0
FRONT_RIGHT_GND
Text Label 10975 7375 0    50   ~ 0
FRONT_RIGHT_UP_SUPPLY
Wire Wire Line
	11275 7575 12000 7575
Wire Wire Line
	11275 7675 12000 7675
Wire Wire Line
	11275 7775 12000 7775
Wire Wire Line
	11275 7875 12000 7875
Text Label 10975 7275 0    50   ~ 0
FRONT_RIGHT_CLOCK+
Text Label 10975 7175 0    50   ~ 0
FRONT_RIGHT_CLOCK-
Text Label 10975 6975 0    50   ~ 0
FRONT_RIGHT_DATA-
Text Label 10975 6875 0    50   ~ 0
FRONT_RIGHT_DATA+
Text Label 10975 6775 0    50   ~ 0
FRONT_RIGHT_KTY+
$Comp
L Connector:Conn_01x13_Female J4
U 1 1 63426E6C
P 10425 7275
F 0 "J4" H 10453 7255 50  0001 L CNN
F 1 "Conn_01x13_Female" H 10453 7210 50  0001 L CNN
F 2 "KTHFS:HEN.1F.308" H 10425 7275 50  0001 C CNN
F 3 "~" H 10425 7275 50  0001 C CNN
	1    10425 7275
	1    0    0    -1  
$EndComp
NoConn ~ 10225 7475
Text Label 9225 6675 0    50   ~ 0
REAR_RIGHT_KTY-
Text Label 9225 7075 0    50   ~ 0
REAR_RIGHT_GND
Text Label 9225 7375 0    50   ~ 0
REAR_RIGHT_UP_SUPPLY
Wire Wire Line
	9500 7575 10225 7575
Wire Wire Line
	9500 7775 10225 7775
Wire Wire Line
	9500 7875 10225 7875
Text Notes 9150 8050 0    50   ~ 0
PIN 9 not used for lemos
Text Label 9225 7275 0    50   ~ 0
REAR_RIGHT_CLOCK+
Text Label 9225 7175 0    50   ~ 0
REAR_RIGHT_CLOCK-
Text Label 9225 6975 0    50   ~ 0
REAR_RIGHT_DATA-
Text Label 9225 6875 0    50   ~ 0
REAR_RIGHT_DATA+
Text Label 9225 6775 0    50   ~ 0
REAR_RIGHT_KTY+
Text Notes 9125 6400 0    50   ~ 0
Motor encoder Lemo-connector\nLemo needs to be grounded since the encoder cable needs to be grounded in both ends
Wire Notes Line
	9125 8075 12300 8075
Wire Notes Line
	12300 8075 12300 6425
Wire Notes Line
	12300 6425 9125 6425
Wire Notes Line
	9125 6425 9125 8075
Text Label 9300 2325 0    50   ~ 0
CAN2_L
NoConn ~ 10475 2225
Text Label 9300 2425 0    50   ~ 0
CAN2_H
Text Label 9300 2525 0    50   ~ 0
CAN1_L
Text Label 9300 2625 0    50   ~ 0
CAN1_H
Text Label 9300 2725 0    50   ~ 0
TS_STATE_VEHICLE-
Text Label 9300 2825 0    50   ~ 0
TS_STATE_VEHICLE+
Text Label 9300 2925 0    50   ~ 0
DISCHARGE_RESISTOR_TEMP-
Text Label 9300 3025 0    50   ~ 0
DISCHARGE_RESISTOR_TEMP+
Text Label 9300 3125 0    50   ~ 0
DISCHARGE_OPEN
Text Label 9300 3225 0    50   ~ 0
ENABLE_REAR_INVERTER2
Text Label 9300 3325 0    50   ~ 0
ENABLE_REAR_INVERTER1
Text Label 9300 3425 0    50   ~ 0
ENABLE_FRONT_INVERTER2
Text Label 9300 3525 0    50   ~ 0
ENABLE_FRONT_INVERTER1
Text Label 9300 3625 0    50   ~ 0
SC_GND
Text Label 9300 3725 0    50   ~ 0
SC_TSMS_RELAYS
Text Label 9300 3825 0    50   ~ 0
SC_HVD_RES
Text Label 9300 3925 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Text Label 9300 4025 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	10475 4025 9300 4025
Wire Wire Line
	9300 3925 10475 3925
Wire Wire Line
	9300 3825 10475 3825
Wire Wire Line
	9300 3725 10475 3725
Wire Wire Line
	9300 3625 10475 3625
Wire Wire Line
	9300 3525 10475 3525
Wire Wire Line
	10475 3325 9300 3325
Wire Wire Line
	9300 3225 10475 3225
Wire Wire Line
	10475 3125 9300 3125
Wire Wire Line
	10475 3025 9300 3025
Wire Wire Line
	9300 2925 10475 2925
Wire Wire Line
	9300 2325 10475 2325
Wire Wire Line
	10475 2425 9300 2425
Wire Wire Line
	9300 2525 10475 2525
Wire Wire Line
	10475 2625 9300 2625
Wire Wire Line
	9300 2725 10475 2725
Wire Wire Line
	10475 2825 9300 2825
Wire Notes Line
	9125 1500 10800 1500
Text Notes 9125 1475 0    50   ~ 0
Inverter/Rearbox lemo      (19 Pin)
$Comp
L power:GND #PWR0104
U 1 1 636D0E5D
P 9425 7700
F 0 "#PWR0104" H 9425 7450 50  0001 C CNN
F 1 "GND" H 9430 7527 50  0000 C CNN
F 2 "" H 9425 7700 50  0001 C CNN
F 3 "" H 9425 7700 50  0001 C CNN
	1    9425 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	9425 7675 9500 7675
Wire Wire Line
	9500 7675 9500 7575
Connection ~ 9500 7675
Wire Wire Line
	9500 7675 10225 7675
Wire Wire Line
	9500 7675 9500 7775
Wire Wire Line
	9500 7775 9500 7875
Connection ~ 9500 7775
$Comp
L power:GND #PWR0105
U 1 1 637629ED
P 11200 7700
F 0 "#PWR0105" H 11200 7450 50  0001 C CNN
F 1 "GND" H 11205 7527 50  0000 C CNN
F 2 "" H 11200 7700 50  0001 C CNN
F 3 "" H 11200 7700 50  0001 C CNN
	1    11200 7700
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 7675 11200 7700
Wire Wire Line
	11200 7675 11275 7675
Wire Wire Line
	11275 7675 11275 7575
Connection ~ 11275 7675
Wire Wire Line
	11275 7675 11275 7775
Wire Wire Line
	11275 7775 11275 7875
Connection ~ 11275 7775
$Comp
L power:GND #PWR0106
U 1 1 637886E3
P 9325 5775
F 0 "#PWR0106" H 9325 5525 50  0001 C CNN
F 1 "GND" H 9330 5602 50  0000 C CNN
F 2 "" H 9325 5775 50  0001 C CNN
F 3 "" H 9325 5775 50  0001 C CNN
	1    9325 5775
	1    0    0    -1  
$EndComp
Wire Wire Line
	9325 5750 9325 5775
Wire Wire Line
	9325 5750 9400 5750
Wire Wire Line
	9400 5750 9400 5650
Connection ~ 9400 5750
Wire Wire Line
	9400 5750 9400 5850
Wire Wire Line
	9400 5850 9400 5950
Connection ~ 9400 5850
$Comp
L power:GND #PWR0107
U 1 1 637ADB1E
P 10600 5775
F 0 "#PWR0107" H 10600 5525 50  0001 C CNN
F 1 "GND" H 10605 5602 50  0000 C CNN
F 2 "" H 10600 5775 50  0001 C CNN
F 3 "" H 10600 5775 50  0001 C CNN
	1    10600 5775
	1    0    0    -1  
$EndComp
Wire Wire Line
	10600 5750 10600 5775
Wire Wire Line
	10600 5750 10675 5750
Wire Wire Line
	10675 5750 10675 5650
Connection ~ 10675 5750
Wire Wire Line
	10675 5750 10675 5850
Wire Wire Line
	10675 5850 10675 5950
Connection ~ 10675 5850
$Comp
L Connector:Conn_01x24_Male J1
U 1 1 6387600F
P 10675 2925
F 0 "J1" H 10647 2807 50  0000 R CNN
F 1 "Conn_01x24_Male" H 11650 2150 50  0001 R CNN
F 2 "KTHFS:HEN.2F.319" H 10675 2925 50  0001 C CNN
F 3 "~" H 10675 2925 50  0001 C CNN
	1    10675 2925
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 6388E013
P 9275 1850
F 0 "#PWR0101" H 9275 1600 50  0001 C CNN
F 1 "GND" H 9280 1677 50  0000 C CNN
F 2 "" H 9275 1850 50  0001 C CNN
F 3 "" H 9275 1850 50  0001 C CNN
	1    9275 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	10475 1725 10250 1725
Wire Wire Line
	10250 1725 10250 1825
Wire Wire Line
	10250 1825 10475 1825
Wire Wire Line
	10250 1825 10250 1850
Wire Wire Line
	10250 1925 10475 1925
Connection ~ 10250 1825
Wire Wire Line
	10250 1925 10250 2025
Wire Wire Line
	10250 2025 10475 2025
Connection ~ 10250 1925
Wire Wire Line
	10250 1850 9275 1850
Connection ~ 10250 1850
Wire Wire Line
	10250 1850 10250 1925
Wire Notes Line
	9125 4100 10800 4100
Wire Notes Line
	10800 1500 10800 4100
Wire Notes Line
	9125 1500 9125 4100
Text Label 2925 7225 0    63   ~ 0
SC_GND
Text Label 2925 7325 0    50   ~ 0
DISCHARGE_OPEN
Wire Wire Line
	2925 7325 4100 7325
Wire Wire Line
	2925 7225 4100 7225
Text Label 2925 7425 0    50   ~ 0
SC_TSMS_RELAYS
Wire Wire Line
	2925 7425 4100 7425
Text Label 2200 10525 0    50   ~ 0
CONTROL_SYSTEM_GND
Text Label 2200 10625 0    50   ~ 0
CAN2_L
Text Label 2200 10725 0    50   ~ 0
CAN2_H
Wire Wire Line
	2200 10625 3250 10625
Wire Wire Line
	3250 10725 2200 10725
Wire Wire Line
	3250 10525 2200 10525
Text Label 700  10525 0    50   ~ 0
CONTROL_SYSTEM_GND
Text Label 700  10625 0    50   ~ 0
CAN2_L
Text Label 700  10725 0    50   ~ 0
CAN2_H
Wire Wire Line
	700  10625 1750 10625
Wire Wire Line
	1750 10725 700  10725
Wire Wire Line
	1750 10525 700  10525
Text Label 4325 9675 0    50   ~ 0
CONTROL_SYSTEM_GND
Text Label 4325 9775 0    50   ~ 0
ENABLE_REAR_INVERTER2
Text Label 4325 9875 0    50   ~ 0
ENABLE_REAR_INVERTER1
Wire Wire Line
	4325 9675 5575 9675
Wire Wire Line
	4325 9875 5575 9875
Wire Wire Line
	5575 9775 4325 9775
Text Label 700  9625 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	700  9625 1950 9625
Wire Wire Line
	700  9825 1950 9825
Wire Wire Line
	1950 9725 700  9725
Text Label 750  8975 0    50   ~ 0
FRONT_LEFT_KTY-
Wire Wire Line
	750  8975 1475 8975
Text Label 750  9075 0    50   ~ 0
FRONT_LEFT_KTY+
Wire Wire Line
	1475 9075 750  9075
Text Label 750  8475 0    50   ~ 0
FRONT_RIGHT_KTY-
Wire Wire Line
	750  8475 1475 8475
Text Label 750  8575 0    50   ~ 0
FRONT_RIGHT_KTY+
Wire Wire Line
	1475 8575 750  8575
Text Label 1925 8975 0    50   ~ 0
REAR_LEFT_KTY-
Wire Wire Line
	1925 8975 2650 8975
Text Label 1925 9075 0    50   ~ 0
REAR_LEFT_KTY+
Wire Wire Line
	2650 9075 1925 9075
Text Label 1975 8475 0    50   ~ 0
REAR_RIGHT_KTY-
Wire Wire Line
	1975 8475 2700 8475
Text Label 1975 8575 0    50   ~ 0
REAR_RIGHT_KTY+
Wire Wire Line
	2700 8575 1975 8575
Text Label 750  7225 0    50   ~ 0
SC_HVD_RES
Text Label 675  4900 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Text Label 675  4700 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	675  4700 1775 4700
Wire Wire Line
	1725 4900 675  4900
Connection ~ 1725 4900
$Comp
L Connector:Conn_01x03_Male J29
U 1 1 60C70B1A
P 1975 5300
F 0 "J29" H 1947 5232 50  0000 R CNN
F 1 "Conn_01x03_Male" H 1947 5323 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 1975 5300 50  0001 C CNN
F 3 "~" H 1975 5300 50  0001 C CNN
	1    1975 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	1725 5400 1775 5400
Wire Wire Line
	1725 5400 1725 5300
Wire Wire Line
	1725 5300 1775 5300
Text Label 675  5400 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Text Label 675  5200 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	675  5200 1775 5200
Wire Wire Line
	1725 5400 675  5400
Connection ~ 1725 5400
Wire Wire Line
	1725 4450 1775 4450
Wire Wire Line
	1725 4450 1725 4350
Wire Wire Line
	1725 4350 1775 4350
Text Label 675  4450 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Text Label 675  4250 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	675  4250 1775 4250
Wire Wire Line
	1725 4450 675  4450
Connection ~ 1725 4450
Wire Wire Line
	1725 4050 1775 4050
Wire Wire Line
	1725 4050 1725 3950
Wire Wire Line
	1725 3950 1775 3950
Text Label 675  4050 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Text Label 675  3850 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	675  3850 1775 3850
Wire Wire Line
	1725 4050 675  4050
Connection ~ 1725 4050
Text Label 700  2825 0    50   ~ 0
CAN1_L
Text Label 700  3125 0    50   ~ 0
CAN1_H
Wire Wire Line
	700  3125 1400 3125
Wire Wire Line
	700  2825 1400 2825
Text Label 700  3225 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	700  3225 1950 3225
Text Label 700  3325 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Wire Wire Line
	700  3325 1950 3325
Text Label 650  1550 0    50   ~ 0
DISCHARGE_RESISTOR_TEMP-
Text Label 650  1650 0    50   ~ 0
DISCHARGE_RESISTOR_TEMP+
Wire Wire Line
	650  1550 2075 1550
Wire Wire Line
	650  1650 2075 1650
Text Label 825  875  0    50   ~ 0
CONTROL_SYSTEM_GND
Text Label 825  975  0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Wire Wire Line
	825  975  2075 975 
Text Notes 600  700  0    98   ~ 0
LV_supply
Text Label 675  2325 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	675  2325 1925 2325
Text Label 675  2425 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Wire Wire Line
	675  2425 1925 2425
Text Notes 600  1925 0    85   ~ 0
TS state
Text Label 750  2125 0    50   ~ 0
TS_STATE_VEHICLE-
Text Label 750  2225 0    50   ~ 0
TS_STATE_VEHICLE+
Wire Wire Line
	750  2125 1925 2125
Wire Wire Line
	1925 2225 750  2225
Text Label 9250 5350 0    50   ~ 0
REAR_LEFT_CLOCK+
Text Label 9250 5250 0    50   ~ 0
REAR_LEFT_CLOCK-
Text Label 9250 5450 0    50   ~ 0
REAR_LEFT_UP_SUPPLY
Wire Wire Line
	9225 6675 10225 6675
Wire Wire Line
	9225 6775 10225 6775
Wire Wire Line
	9225 6875 10225 6875
Wire Wire Line
	9225 6975 10225 6975
Wire Wire Line
	9225 7075 10225 7075
Wire Wire Line
	9225 7175 10225 7175
Wire Wire Line
	9225 7275 10225 7275
Wire Wire Line
	9225 7375 10225 7375
Wire Wire Line
	10975 7375 12000 7375
Wire Wire Line
	10975 7275 12000 7275
Wire Wire Line
	10975 7175 12000 7175
Wire Wire Line
	10975 7075 12000 7075
Wire Wire Line
	10975 6975 12000 6975
Wire Wire Line
	10975 6875 12000 6875
Wire Wire Line
	10975 6775 12000 6775
Wire Wire Line
	10975 6675 12000 6675
Wire Wire Line
	9425 7675 9425 7700
Wire Wire Line
	9250 5450 10125 5450
Wire Wire Line
	9250 5350 10125 5350
Wire Wire Line
	9250 5250 10125 5250
Wire Wire Line
	9250 5150 10125 5150
Wire Wire Line
	9250 5050 10125 5050
Wire Wire Line
	9250 4950 10125 4950
Wire Wire Line
	9250 4850 10125 4850
Wire Wire Line
	9250 4750 10125 4750
Wire Wire Line
	10450 5450 11400 5450
Wire Wire Line
	10450 5350 11400 5350
Wire Wire Line
	10450 5250 11400 5250
Wire Wire Line
	10450 5150 11400 5150
Wire Wire Line
	10450 5050 11400 5050
Wire Wire Line
	10450 4950 11400 4950
Wire Wire Line
	10450 4850 11400 4850
Wire Wire Line
	10450 4750 11400 4750
Text Label 875  6050 0    50   ~ 0
CONTROL_SYSTEM_GND
Wire Wire Line
	875  6050 2075 6050
Text Label 925  6150 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Wire Wire Line
	925  6150 2525 6150
Text Label 725  6350 0    50   ~ 0
SC_HVD_RES
Wire Wire Line
	725  6350 2075 6350
Text Label 700  6450 0    50   ~ 0
SC_TSMS_RELAYS
Wire Wire Line
	700  6450 2525 6450
Text Label 700  6550 0    63   ~ 0
SC_GND
Wire Wire Line
	700  6550 2975 6550
Wire Notes Line
	3425 5775 650  5775
Wire Notes Line
	650  5775 650  6650
Wire Notes Line
	650  6650 3425 6650
Wire Notes Line
	3425 5775 3425 6650
Wire Notes Line
	3325 5525 3325 3700
Wire Notes Line
	3325 3700 625  3700
Wire Notes Line
	625  3700 625  5525
Wire Notes Line
	625  5525 3325 5525
Wire Notes Line
	600  3425 2875 3425
Wire Notes Line
	2875 3425 2875 2700
Wire Notes Line
	2875 2700 600  2700
Wire Notes Line
	600  2700 600  3425
Wire Notes Line
	600  1750 3025 1750
Wire Notes Line
	3025 1750 3025 1375
Wire Notes Line
	600  1750 600  1375
Wire Notes Line
	600  1375 3025 1375
$Comp
L power:GND #PWR0102
U 1 1 6382C35D
P 700 900
F 0 "#PWR0102" H 700 650 50  0001 C CNN
F 1 "GND" H 705 727 50  0000 C CNN
F 2 "" H 700 900 50  0001 C CNN
F 3 "" H 700 900 50  0001 C CNN
	1    700  900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	700  900  700  875 
Wire Wire Line
	700  875  2075 875 
Wire Notes Line
	600  1125 600  750 
Wire Notes Line
	600  750  3025 750 
Wire Notes Line
	3025 750  3025 1125
Wire Notes Line
	600  1125 3025 1125
Text Notes 1650 725  0    40   ~ 0
(CONTROL_SYSTEM_GND USED AS GND PLANE)
Wire Notes Line
	625  2000 2825 2000
Wire Notes Line
	2825 2000 2825 2500
Wire Notes Line
	2825 2500 600  2500
Wire Notes Line
	600  2500 600  2000
Text Label 5600 1875 0    50   ~ 0
REAR_LEFT_DATA+
Text Label 5600 1775 0    50   ~ 0
REAR_LEFT_DATA-
Text Label 5600 1575 0    50   ~ 0
REAR_LEFT_GND
Text Label 5600 1475 0    50   ~ 0
REAR_LEFT_CLOCK+
Text Label 5600 1375 0    50   ~ 0
REAR_LEFT_CLOCK-
Text Label 5600 1675 0    50   ~ 0
REAR_LEFT_UP_SUPPLY
Wire Wire Line
	5600 1675 6475 1675
Wire Wire Line
	5600 1575 6475 1575
Wire Wire Line
	5600 1775 6475 1775
Wire Wire Line
	5600 1875 6475 1875
Wire Wire Line
	5600 1475 6475 1475
Wire Wire Line
	5600 1375 6475 1375
Text Label 4125 1675 0    50   ~ 0
FRONT_LEFT_UP_SUPPLY
Text Label 4125 1575 0    50   ~ 0
FRONT_LEFT_GND
Text Label 4125 1475 0    50   ~ 0
FRONT_LEFT_CLOCK+
Text Label 4125 1375 0    50   ~ 0
FRONT_LEFT_CLOCK-
Wire Wire Line
	4125 1675 5075 1675
Wire Wire Line
	4125 1475 5075 1475
Wire Wire Line
	4125 1375 5075 1375
Wire Wire Line
	4125 1575 5075 1575
Wire Wire Line
	4125 1875 5075 1875
Wire Wire Line
	4125 1775 5075 1775
Text Label 4125 1875 0    50   ~ 0
FRONT_LEFT_DATA+
Text Label 4125 1775 0    50   ~ 0
FRONT_LEFT_DATA-
Text Label 5600 2950 0    50   ~ 0
REAR_RIGHT_DATA+
Text Label 5600 2850 0    50   ~ 0
REAR_RIGHT_DATA-
Text Label 5600 2650 0    50   ~ 0
REAR_RIGHT_GND
Text Label 5600 2550 0    50   ~ 0
REAR_RIGHT_CLOCK+
Text Label 5600 2450 0    50   ~ 0
REAR_RIGHT_CLOCK-
Text Label 5600 2750 0    50   ~ 0
REAR_RIGHT_UP_SUPPLY
Wire Wire Line
	5600 2750 6475 2750
Wire Wire Line
	5600 2650 6475 2650
Wire Wire Line
	5600 2850 6475 2850
Wire Wire Line
	5600 2950 6475 2950
Wire Wire Line
	5600 2550 6475 2550
Wire Wire Line
	5600 2450 6475 2450
Text Label 4125 2750 0    50   ~ 0
FRONT_RIGHT_UP_SUPPLY
Text Label 4125 2650 0    50   ~ 0
FRONT_RIGHT_GND
Text Label 4125 2550 0    50   ~ 0
FRONT_RIGHT_CLOCK+
Text Label 4125 2450 0    50   ~ 0
FRONT_RIGHT_CLOCK-
Wire Wire Line
	4125 2750 5075 2750
Wire Wire Line
	4125 2550 5075 2550
Wire Wire Line
	4125 2450 5075 2450
Wire Wire Line
	4125 2650 5075 2650
Wire Wire Line
	4125 2950 5075 2950
Wire Wire Line
	4125 2850 5075 2850
Text Label 4125 2950 0    50   ~ 0
FRONT_RIGHT_DATA+
Text Label 4125 2850 0    50   ~ 0
FRONT_RIGHT_DATA-
Wire Notes Line
	650  9225 650  8200
Wire Notes Line
	650  8200 3125 8200
Wire Notes Line
	3125 8200 3125 9225
Wire Notes Line
	650  9225 3125 9225
Wire Notes Line
	650  9400 650  10000
Text Notes 700  10425 0    63   ~ 0
Front Inverters
Text Notes 2200 10425 0    63   ~ 0
Rear Inverters
Wire Notes Line
	650  10300 650  10850
Wire Notes Line
	650  10850 3650 10850
Wire Notes Line
	3650 10850 3650 10300
Wire Notes Line
	3650 10300 650  10300
Wire Wire Line
	750  7225 1350 7225
Wire Notes Line
	650  7925 650  6875
Wire Notes Line
	650  6875 4450 6875
Wire Notes Line
	650  7925 4450 7925
Wire Notes Line
	4450 6875 4450 7925
NoConn ~ 10475 2125
Text Notes 8375 775  0    63   ~ 0
CONTACTS ON FRONT SIDE (LEMOS)
Wire Notes Line
	7875 550  7875 10750
Text Notes 6100 775  0    63   ~ 0
CONTACTS ON BACK SIDE
$Comp
L Connector:Conn_01x09_Female J12
U 1 1 63F4E109
P 5275 2850
F 0 "J12" H 5303 2876 50  0000 L CNN
F 1 "Conn_01x09_Female" H 5303 2785 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Vertical_P2.77x2.84mm" H 5275 2850 50  0001 C CNN
F 3 "~" H 5275 2850 50  0001 C CNN
	1    5275 2850
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x09_Female J2
U 1 1 63F50BDA
P 5275 1775
F 0 "J2" H 5303 1801 50  0000 L CNN
F 1 "Conn_01x09_Female" H 5303 1710 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Vertical_P2.77x2.84mm" H 5275 1775 50  0001 C CNN
F 3 "~" H 5275 1775 50  0001 C CNN
	1    5275 1775
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x09_Female J13
U 1 1 63F62498
P 6675 1775
F 0 "J13" H 6703 1801 50  0000 L CNN
F 1 "Conn_01x09_Female" H 6703 1710 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Vertical_P2.77x2.84mm" H 6675 1775 50  0001 C CNN
F 3 "~" H 6675 1775 50  0001 C CNN
	1    6675 1775
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x09_Female J14
U 1 1 63F7397A
P 6675 2850
F 0 "J14" H 6703 2876 50  0000 L CNN
F 1 "Conn_01x09_Female" H 6703 2785 50  0000 L CNN
F 2 "Connector_Dsub:DSUB-9_Female_Vertical_P2.77x2.84mm" H 6675 2850 50  0001 C CNN
F 3 "~" H 6675 2850 50  0001 C CNN
	1    6675 2850
	1    0    0    -1  
$EndComp
Wire Notes Line
	4075 3375 6800 3375
Wire Notes Line
	6800 1150 6800 3375
Text Label 4125 1975 0    50   ~ 0
FRONT_LEFT_GND
Wire Wire Line
	4125 1975 5075 1975
Text Label 4125 2075 0    50   ~ 0
FRONT_LEFT_GND
Wire Wire Line
	4125 2075 5075 2075
Text Label 4125 2175 0    50   ~ 0
FRONT_LEFT_GND
Wire Wire Line
	4125 2175 5075 2175
Text Label 5600 1975 0    50   ~ 0
REAR_LEFT_GND
Wire Wire Line
	5600 1975 6475 1975
Text Label 5600 2075 0    50   ~ 0
REAR_LEFT_GND
Wire Wire Line
	5600 2075 6475 2075
Text Label 5600 2175 0    50   ~ 0
REAR_LEFT_GND
Wire Wire Line
	5600 2175 6475 2175
Text Label 5600 3050 0    50   ~ 0
REAR_RIGHT_GND
Wire Wire Line
	5600 3050 6475 3050
Text Label 5600 3150 0    50   ~ 0
REAR_RIGHT_GND
Wire Wire Line
	5600 3150 6475 3150
Text Label 5600 3250 0    50   ~ 0
REAR_RIGHT_GND
Wire Wire Line
	5600 3250 6475 3250
Text Label 4125 3050 0    50   ~ 0
FRONT_RIGHT_GND
Wire Wire Line
	4125 3050 5075 3050
Text Label 4125 3150 0    50   ~ 0
FRONT_RIGHT_GND
Wire Wire Line
	4125 3150 5075 3150
Text Label 4125 3250 0    50   ~ 0
FRONT_RIGHT_GND
Wire Wire Line
	4125 3250 5075 3250
Wire Notes Line
	4075 3375 4075 1150
Wire Notes Line
	4075 1150 6800 1150
Text Notes 4075 3575 0    63   ~ 0
DSUB connectors, 9 PIN used due to 7 PIN not beeing\navailable.
$Comp
L Device:Jumper JP3
U 1 1 63FE6132
P 6225 9775
F 0 "JP3" H 6225 10039 50  0000 C CNN
F 1 "Jumper" H 6225 9948 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 6225 9775 50  0001 C CNN
F 3 "~" H 6225 9775 50  0001 C CNN
	1    6225 9775
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP4
U 1 1 640237B2
P 6225 9875
F 0 "JP4" H 5675 9950 50  0000 C CNN
F 1 "Jumper" H 5900 9950 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 6225 9875 50  0001 C CNN
F 3 "~" H 6225 9875 50  0001 C CNN
	1    6225 9875
	-1   0    0    1   
$EndComp
$Comp
L Device:Jumper JP1
U 1 1 64036FEC
P 2525 9725
F 0 "JP1" H 2525 9989 50  0000 C CNN
F 1 "Jumper" H 2525 9898 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 2525 9725 50  0001 C CNN
F 3 "~" H 2525 9725 50  0001 C CNN
	1    2525 9725
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP2
U 1 1 64036FF2
P 2525 9825
F 0 "JP2" H 2025 9925 50  0000 C CNN
F 1 "Jumper" H 2250 9925 50  0000 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 2525 9825 50  0001 C CNN
F 3 "~" H 2525 9825 50  0001 C CNN
	1    2525 9825
	-1   0    0    1   
$EndComp
Text Label 2975 9725 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Text Label 2975 9825 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Text Label 6675 9775 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Text Label 6675 9875 0    50   ~ 0
CONTROL_SYSTEM_SUPPLY
Wire Wire Line
	5575 9775 5925 9775
Connection ~ 5575 9775
Wire Wire Line
	5925 9875 5575 9875
Connection ~ 5575 9875
Wire Wire Line
	6525 9775 6675 9775
Wire Wire Line
	6675 9875 6525 9875
Wire Wire Line
	2975 9825 2825 9825
Wire Wire Line
	2825 9725 2975 9725
Wire Wire Line
	2225 9725 1950 9725
Connection ~ 1950 9725
Wire Wire Line
	1950 9825 2225 9825
Connection ~ 1950 9825
Wire Notes Line
	7725 10000 7725 9400
Wire Notes Line
	650  10000 7725 10000
Wire Notes Line
	650  9400 7725 9400
Text Notes 650  10100 0    63   ~ 0
Added jumpers for optional shorting of EF to control sytem supply if dSPACE should no longer do it.
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 63FD5EC2
P 11275 7575
F 0 "#FLG0101" H 11275 7650 50  0001 C CNN
F 1 "PWR_FLAG" H 11275 7725 50  0000 C CNN
F 2 "" H 11275 7575 50  0001 C CNN
F 3 "~" H 11275 7575 50  0001 C CNN
	1    11275 7575
	1    0    0    -1  
$EndComp
Connection ~ 11275 7575
Wire Wire Line
	10475 3425 9300 3425
Text Label 700  9725 0    50   ~ 0
ENABLE_FRONT_INVERTER2
Text Label 700  9825 0    50   ~ 0
ENABLE_FRONT_INVERTER1
$EndSCHEMATC
