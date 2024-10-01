EESchema Schematic File Version 4
LIBS:discharge-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 2
Title "discharge"
Date "2023-04-20"
Rev "1"
Comp "KTH Formula Student"
Comment1 "DeV17"
Comment2 "Lucas Falcon"
Comment3 "falcon@kth.se"
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5DA2CC8A
P 2550 3150
F 0 "J1" H 2522 3124 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2522 3033 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_vert_2" H 2550 3150 50  0001 C CNN
F 3 "~" H 2550 3150 50  0001 C CNN
	1    2550 3150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J2
U 1 1 5E90CD01
P 2550 3550
F 0 "J2" H 2500 3600 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2500 3500 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_vert_2" H 2550 3550 50  0001 C CNN
F 3 "~" H 2550 3550 50  0001 C CNN
	1    2550 3550
	1    0    0    -1  
$EndComp
Text Notes 2837 3041 2    50   ~ 0
To TS
$Sheet
S 4050 3550 1150 600 
U 5E536ABB
F0 "Relay" 50
F1 "relay.sch" 50
F2 "Ingoing_terminal" U L 4050 4050 50 
F3 "Outgoing_terminal" U L 4050 3650 50 
F4 "Coil+" I R 5200 3650 50 
F5 "Coil-" I R 5200 4050 50 
$EndSheet
Text Label 2950 3150 2    50   ~ 0
TS+
Text Label 2950 3250 2    50   ~ 0
TS-
Wire Wire Line
	2750 3950 2950 3950
Text Notes 3138 3825 2    50   ~ 0
To discharge resistor
Text Label 6700 3350 0    50   ~ 0
SDC_TSMS_relays
$Comp
L power:GND #PWR03
U 1 1 5E9B810B
P 8550 4150
F 0 "#PWR03" H 8550 3900 50  0001 C CNN
F 1 "GND" H 8550 3975 50  0000 C CNN
F 2 "" H 8550 4150 50  0001 C CNN
F 3 "" H 8550 4150 50  0001 C CNN
	1    8550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	8550 4050 8550 4150
$Comp
L Transistor_BJT:BC857 Q1
U 1 1 5EB4B334
P 6600 3650
F 0 "Q1" H 6791 3604 50  0000 L CNN
F 1 "BC857" H 6791 3695 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6800 3575 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC856.pdf" H 6600 3650 50  0001 L CNN
	1    6600 3650
	1    0    0    1   
$EndComp
Wire Wire Line
	6700 3450 6700 3350
Wire Wire Line
	6700 3350 7850 3350
$Comp
L Device:R R1
U 1 1 5EB4F76A
P 6450 3350
F 0 "R1" V 6243 3350 50  0000 C CNN
F 1 "51" V 6334 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6380 3350 50  0001 C CNN
F 3 "~" H 6450 3350 50  0001 C CNN
	1    6450 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	6600 3350 6700 3350
Connection ~ 6700 3350
Wire Wire Line
	6300 3350 6150 3350
Wire Wire Line
	6150 3350 6150 3650
Wire Wire Line
	6150 3650 6400 3650
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5EB61FF6
P 8900 3950
F 0 "J4" H 8872 3974 50  0000 R CNN
F 1 "Conn_01x03_Male" H 8872 3883 50  0000 R CNN
F 2 "Connector_Molex:Molex_KK-254_AE-6410-03A_1x03_P2.54mm_Vertical" H 8900 3950 50  0001 C CNN
F 3 "~" H 8900 3950 50  0001 C CNN
	1    8900 3950
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8700 4050 8550 4050
$Comp
L Device:R R3
U 1 1 5EB63DC8
P 7050 3950
F 0 "R3" V 7150 3950 50  0000 C CNN
F 1 "5.1k" V 7250 3950 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6980 3950 50  0001 C CNN
F 3 "~" H 7050 3950 50  0001 C CNN
	1    7050 3950
	0    1    1    0   
$EndComp
Wire Wire Line
	8700 3950 7200 3950
Wire Wire Line
	6900 3950 6700 3950
Wire Wire Line
	6700 3950 6700 3850
Wire Wire Line
	8700 3850 7850 3850
Wire Wire Line
	7850 3850 7850 3350
$Comp
L Device:LED D1
U 1 1 5EB66B5F
P 6700 4400
F 0 "D1" V 6739 4282 50  0000 R CNN
F 1 "yellow" V 6648 4282 50  0000 R CNN
F 2 "LED_SMD:LED_0603_1608Metric" H 6700 4400 50  0001 C CNN
F 3 "~" H 6700 4400 50  0001 C CNN
	1    6700 4400
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR02
U 1 1 5EB688B2
P 6700 5150
F 0 "#PWR02" H 6700 4900 50  0001 C CNN
F 1 "GND" H 6705 4977 50  0000 C CNN
F 2 "" H 6700 5150 50  0001 C CNN
F 3 "" H 6700 5150 50  0001 C CNN
	1    6700 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6700 4550 6700 4650
$Comp
L Device:R R2
U 1 1 5EB69F4D
P 6700 4800
F 0 "R2" H 6630 4754 50  0000 R CNN
F 1 "1k" H 6630 4845 50  0000 R CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 6630 4800 50  0001 C CNN
F 3 "~" H 6700 4800 50  0001 C CNN
	1    6700 4800
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 4950 6700 5050
Wire Wire Line
	6700 4250 6700 3950
Connection ~ 6700 3950
Text Label 7450 3950 0    50   ~ 0
discharge_open
Text Label 3650 4050 2    50   ~ 0
discharge_resistor_low
Wire Wire Line
	2750 4050 4050 4050
$Comp
L power:PWR_FLAG #FLG0102
U 1 1 5FAF12DF
P 6700 5050
F 0 "#FLG0102" H 6700 5125 50  0001 C CNN
F 1 "PWR_FLAG" V 6700 5177 50  0000 L CNN
F 2 "" H 6700 5050 50  0001 C CNN
F 3 "~" H 6700 5050 50  0001 C CNN
	1    6700 5050
	0    -1   -1   0   
$EndComp
Connection ~ 6700 5050
Wire Wire Line
	6700 5050 6700 5150
Text Notes 5773 3008 0    50   ~ 0
Pseudo relay sensor\nCircuit that senses the current going through the relay coil
Text Notes 3750 3425 0    50   ~ 0
Normally Closed relay
Wire Wire Line
	2750 3550 2950 3550
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5FB5BDB0
P 2550 3950
F 0 "J3" H 2522 3924 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2522 3833 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_vert_2" H 2550 3950 50  0001 C CNN
F 3 "~" H 2550 3950 50  0001 C CNN
	1    2550 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3150 2950 3150
Text Notes 2991 3419 2    50   ~ 0
To HV_sensor_2
Wire Wire Line
	5200 3650 6150 3650
Connection ~ 6150 3650
Wire Wire Line
	2750 3250 2950 3250
Text Label 2950 3650 2    50   ~ 0
TS-
Text Label 2950 3950 2    50   ~ 0
TS+
Wire Wire Line
	2750 3650 4050 3650
Text Label 2950 3550 2    50   ~ 0
TS+
Wire Notes Line
	2500 4650 2500 4850
Wire Notes Line
	2500 4850 2600 4850
Wire Notes Line
	2600 4850 2600 4650
Wire Notes Line
	2550 4050 2550 4650
Wire Notes Line
	2500 4650 2600 4650
Text Notes 2700 5100 0    50   ~ 0
TS+
Text Notes 2650 4800 0    50   ~ 0
4.7 kOhm\n100 W
Wire Notes Line
	2550 4850 2550 5500
Wire Notes Line
	2500 5500 2600 5500
Wire Notes Line
	2450 5500 2450 5550
Wire Notes Line
	2450 5550 2650 5550
Wire Notes Line
	2650 5550 2650 5500
Wire Notes Line
	2550 5550 2550 5900
Wire Notes Line
	2900 5500 3000 5500
Wire Notes Line
	2850 5500 2850 5550
Wire Notes Line
	2850 5550 3050 5550
Wire Notes Line
	3050 5550 3050 5500
Wire Notes Line
	2950 5550 2950 5900
Wire Notes Line
	3300 5500 3400 5500
Wire Notes Line
	3250 5500 3250 5550
Wire Notes Line
	3250 5550 3450 5550
Wire Notes Line
	3450 5550 3450 5500
Wire Notes Line
	3350 5550 3350 5900
Wire Notes Line
	3700 5500 3800 5500
Wire Notes Line
	3650 5500 3650 5550
Wire Notes Line
	3650 5550 3850 5550
Wire Notes Line
	3850 5550 3850 5500
Wire Notes Line
	3750 5550 3750 5900
Wire Notes Line
	2950 5150 2950 5500
Wire Notes Line
	3350 5150 3350 5500
Wire Notes Line
	3750 5150 3750 5500
Text Notes 3200 5000 0    50   ~ 0
U_TS max = 529.2 V\nP_max = 59.59 W\nC_tot = 300 uF\nt_dis = -ln(60V/529.2V)*R*C\n+ 0.25 s = 3.32 s
Text Notes 2700 5850 0    50   ~ 0
TS-
Wire Notes Line
	4050 5300 4050 5750
Wire Notes Line
	4050 5750 4550 5750
Wire Notes Line
	4550 5750 4550 5300
Wire Notes Line
	4550 5300 4050 5300
Text Notes 4150 5700 0    50   ~ 0
INVERTER
Wire Notes Line
	4300 5750 4300 5900
Wire Notes Line
	1800 5900 1800 3650
Wire Notes Line
	1800 3650 2600 3650
Wire Notes Line
	1800 5900 4300 5900
Wire Notes Line
	4300 5150 4300 5300
Wire Notes Line rgb(0, 0, 0)
	4650 2400 4650 6100
Wire Notes Line rgb(0, 0, 0)
	4650 6100 750  6100
Wire Notes Line rgb(0, 0, 0)
	750  6100 750  2400
Text Notes 900  2700 0    157  ~ 0
TS
Wire Notes Line
	4850 6100 10950 6100
Wire Notes Line
	10950 6100 10950 2400
Wire Notes Line
	10950 2400 4850 2400
Wire Notes Line
	4850 2400 4850 6100
Text Notes 10400 2750 0    157  ~ 0
GLV
Wire Notes Line
	2550 5150 4300 5150
Wire Notes Line rgb(0, 0, 0)
	750  2400 4650 2400
Text Notes 1775 6025 0    50   ~ 0
No interlocked connector between capacitors and discharge resistors
Text Notes 9094 4360 2    50   ~ 0
 - SDC GND
Text Notes 7727 3354 2    50   ~ 0
 - SDC IN
Text Notes 10878 3757 2    50   ~ 0
Discharge circuit connected to shutdown circuit (after last component, TSMS)
Text Notes 7344 4950 0    50   ~ 0
I > 15 mA => discharge_open > 5 V\nI < 6 mA => discharge_open = 0 V
Text Notes 6450 4450 2    50   ~ 0
 - SDC GND
$Comp
L power:GND #PWR01
U 1 1 5EB6AEBE
P 5900 4250
F 0 "#PWR01" H 5900 4000 50  0001 C CNN
F 1 "GND" H 5905 4077 50  0000 C CNN
F 2 "" H 5900 4250 50  0001 C CNN
F 3 "" H 5900 4250 50  0001 C CNN
	1    5900 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4250 5900 4050
Wire Wire Line
	5900 4050 5200 4050
Text Notes 7246 5356 2    50   ~ 0
 - SDC GND
Text Notes 3025 4550 0    50   ~ 0
Discharge resistor can handle 60 W \nat over 80 degrees Celsius continuously.
Text Notes 9075 3950 0    50   ~ 0
From TSMS
$EndSCHEMATC
