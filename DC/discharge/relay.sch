EESchema Schematic File Version 4
LIBS:discharge-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 2
Title "discharge"
Date "2023-04-20"
Rev "1"
Comp "KTH Formula Student"
Comment1 "DeV17"
Comment2 "Lucas Falcon"
Comment3 "falcon@kth.se"
Comment4 ""
$EndDescr
Text HLabel 3550 3450 0    50   UnSpc ~ 0
Ingoing_terminal
Text HLabel 3550 4650 0    50   UnSpc ~ 0
Outgoing_terminal
Text HLabel 6350 3450 2    50   Input ~ 0
Coil+
Text HLabel 6350 4650 2    50   Input ~ 0
Coil-
$Comp
L Device:CP C1
U 1 1 5E9D0D46
P 5200 3750
F 0 "C1" H 5318 3796 50  0000 L CNN
F 1 "CP" H 5318 3705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 5238 3600 50  0001 C CNN
F 3 "~" H 5200 3750 50  0001 C CNN
	1    5200 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5E9D1C28
P 5200 4350
F 0 "R5" H 5270 4396 50  0000 L CNN
F 1 "R" H 5270 4305 50  0000 L CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 5130 4350 50  0001 C CNN
F 3 "~" H 5200 4350 50  0001 C CNN
	1    5200 4350
	-1   0    0    -1  
$EndComp
$Comp
L Device:D_Schottky D3
U 1 1 5E9D2FD4
P 5600 3450
F 0 "D3" H 5600 3234 50  0000 C CNN
F 1 "D_Schottky" H 5600 3325 50  0000 C CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 5600 3450 50  0001 C CNN
F 3 "~" H 5600 3450 50  0001 C CNN
	1    5600 3450
	1    0    0    1   
$EndComp
$Comp
L Device:D_Schottky D4
U 1 1 5E9D4A7B
P 5450 4350
F 0 "D4" V 5404 4272 50  0000 R CNN
F 1 "D_Schottky" V 5495 4272 50  0000 R CNN
F 2 "Diode_SMD:D_0603_1608Metric" H 5450 4350 50  0001 C CNN
F 3 "~" H 5450 4350 50  0001 C CNN
	1    5450 4350
	0    -1   1    0   
$EndComp
Wire Wire Line
	5450 4050 5200 4050
Wire Wire Line
	5200 4050 5200 3900
Wire Wire Line
	4300 4650 5200 4650
Wire Wire Line
	4300 4350 4300 4650
Wire Wire Line
	5450 4500 5450 4650
Connection ~ 5450 4650
Wire Wire Line
	5450 4050 5450 4200
Wire Wire Line
	5200 4050 5200 4200
Connection ~ 5200 4050
Wire Wire Line
	5200 4500 5200 4650
Connection ~ 5200 4650
Wire Wire Line
	5200 4650 5450 4650
Connection ~ 5200 3450
Wire Wire Line
	5200 3450 4300 3450
Wire Wire Line
	5450 3450 5200 3450
$Comp
L KTHFS:DBR72410 K1
U 1 1 5E9C0B21
P 4100 4050
F 0 "K1" H 3670 4096 50  0000 R CNN
F 1 "DBR72410" H 3670 4005 50  0000 R CNN
F 2 "KTHFS:DxR72410" H 4450 4000 50  0001 L CNN
F 3 "" H 4100 4050 50  0001 C CNN
	1    4100 4050
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3900 4350 3900 4650
Wire Wire Line
	3900 4650 3550 4650
Wire Wire Line
	3550 3450 3900 3450
Wire Wire Line
	5200 3450 5200 3600
Wire Wire Line
	4300 3450 4300 3750
Wire Wire Line
	3900 3450 3900 3750
Text Notes 5150 3350 2    50   ~ 0
Additional closing delay\n250 ms
Wire Wire Line
	6350 3450 5750 3450
Wire Wire Line
	6350 4650 5450 4650
Wire Notes Line
	4950 3600 4950 4500
Wire Notes Line
	4950 4500 6000 4500
Wire Notes Line
	6000 4500 6000 3600
Wire Notes Line
	6000 3600 4950 3600
Text Notes 5400 3700 0    50   ~ 0
May be omitted
Wire Notes Line
	4000 3050 4000 5000
Wire Notes Line
	4000 5000 2100 5000
Wire Notes Line
	2100 5000 2100 3050
Wire Notes Line
	2100 3050 4000 3050
Wire Notes Line
	4100 3050 4100 5000
Wire Notes Line
	4100 5000 6900 5000
Wire Notes Line
	6900 5000 6900 3050
Wire Notes Line
	6900 3050 4100 3050
Text Notes 2200 3300 0    157  ~ 0
TS
Text Notes 6350 3300 0    157  ~ 0
GLV
Text Notes 3750 2925 0    50   ~ 0
Normally closed relay
$EndSCHEMATC
