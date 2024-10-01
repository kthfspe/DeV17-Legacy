EESchema Schematic File Version 4
LIBS:power_distribution_board-cache
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "power_distribution_board"
Date "2021-06-06"
Rev "1.0"
Comp "KTH Formula Student"
Comment1 "DeV17"
Comment2 "Holger Stenberg"
Comment3 "holger.98@hotmail.com"
Comment4 ""
$EndDescr
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 60BD2223
P 1500 3225
F 0 "J2" H 1550 3550 50  0000 R CNN
F 1 "LEMO: HES. 0F. 303" H 1900 3450 50  0000 R CNN
F 2 "KTHFS:HEN.0F.303" H 1500 3225 50  0001 C CNN
F 3 "~" H 1500 3225 50  0001 C CNN
	1    1500 3225
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J3
U 1 1 60BD3B74
P 1500 3975
F 0 "J3" H 1550 4250 50  0000 R CNN
F 1 "LEMO: HEN. 0F. 303" H 1900 4175 50  0000 R CNN
F 2 "KTHFS:HEN.0F.303" H 1500 3975 50  0001 C CNN
F 3 "~" H 1500 3975 50  0001 C CNN
	1    1500 3975
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x12_Female J4
U 1 1 60BD4B54
P 10225 2750
F 0 "J4" H 10175 3475 50  0000 L CNN
F 1 "LEMO: HEN.2F.312" H 9825 3375 50  0000 L CNN
F 2 "KTHFS:HEN.2F.312" H 10225 2750 50  0001 C CNN
F 3 "~" H 10225 2750 50  0001 C CNN
	1    10225 2750
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 60BE321B
P 10225 3900
F 0 "J5" H 10275 4200 50  0000 R CNN
F 1 "LEMO: HEN. 0F. 303" H 10600 4100 50  0000 R CNN
F 2 "KTHFS:HEN.0F.303" H 10225 3900 50  0001 C CNN
F 3 "~" H 10225 3900 50  0001 C CNN
	1    10225 3900
	-1   0    0    -1  
$EndComp
Text Notes 10300 2775 0    50   ~ 0
To rear_LV_box
Text Label 9125 2250 0    50   ~ 0
control_systems_supply
Text Label 9125 2350 0    50   ~ 0
control_systems_supply
Text Label 9125 2450 0    50   ~ 0
control_systems_gnd
Text Label 9125 2550 0    50   ~ 0
control_systems_gnd
Text Label 9125 2650 0    50   ~ 0
cooling_supply
Text Label 9125 2750 0    50   ~ 0
cooling_supply
Text Label 9125 2850 0    50   ~ 0
cooling_gnd
Text Label 9125 2950 0    50   ~ 0
cooling_gnd
Text Label 9125 3050 0    50   ~ 0
inverter_supply
Text Label 9125 3150 0    50   ~ 0
inverter_gnd
Text Label 9125 3250 0    50   ~ 0
SC_fuse_RES
Text Label 9125 3350 0    50   ~ 0
SC_GND
Wire Wire Line
	9125 2250 10025 2250
Wire Wire Line
	10025 2350 9125 2350
Wire Wire Line
	9125 2450 10025 2450
Wire Wire Line
	10025 2650 9125 2650
Wire Wire Line
	9125 2750 10025 2750
Wire Wire Line
	10025 2850 9125 2850
Wire Wire Line
	10025 3050 9125 3050
Wire Wire Line
	10025 3250 9125 3250
$Comp
L Connector:Conn_01x01_Male J1+1
U 1 1 60BF2647
P 1500 2150
F 0 "J1+1" H 1500 2325 50  0000 C CNN
F 1 "solder_pad" H 1500 2250 50  0000 C CNN
F 2 "KTHFS:WirePad_2mm-5mm" H 1500 2150 50  0001 C CNN
F 3 "~" H 1500 2150 50  0001 C CNN
	1    1500 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x01_Male J1-1
U 1 1 60BF2F63
P 1500 2400
F 0 "J1-1" H 1500 2575 50  0000 C CNN
F 1 "solder_pad" H 1500 2500 50  0000 C CNN
F 2 "KTHFS:WirePad_2mm-5mm" H 1500 2400 50  0001 C CNN
F 3 "~" H 1500 2400 50  0001 C CNN
	1    1500 2400
	1    0    0    -1  
$EndComp
Text Label 3050 2150 2    50   ~ 0
LV_power_distribution_board_supply
Text Label 3050 2400 2    50   ~ 0
LV_power_distribution_board_gnd
Wire Wire Line
	1700 2150 3050 2150
Wire Wire Line
	3050 2400 1700 2400
NoConn ~ 1700 3325
Text Label 3150 3225 2    50   ~ 0
LV_ASMS
Text Label 3075 3875 2    50   ~ 0
DV_actuator_supply
Wire Wire Line
	3075 3875 1700 3875
Text Label 3075 3975 2    50   ~ 0
DV_actuator_gnd
Wire Wire Line
	3075 3975 1700 3975
Text Label 3075 4075 2    50   ~ 0
RES2
Wire Wire Line
	1700 4075 3075 4075
Text Notes 1425 3200 2    50   ~ 0
ASMS connection
Text Notes 1425 3950 2    50   ~ 0
RES connection
Text Label 8650 3800 0    50   ~ 0
DV_actuator_supply
Wire Wire Line
	8650 3800 10025 3800
Text Label 8650 3900 0    50   ~ 0
DV_actuator_gnd
Wire Wire Line
	8650 3900 10025 3900
Text Label 8650 4000 0    50   ~ 0
RES2
Wire Wire Line
	10025 4000 8650 4000
Text Notes 10300 3925 0    50   ~ 0
DV_box connection
Text Notes 1050 2175 0    50   ~ 0
LVMS
Text Notes 1250 2450 2    50   ~ 0
LV-battery\nnegative pole
$Comp
L Device:Fuse F2
U 1 1 60C1719A
P 6025 2750
F 0 "F2" V 5828 2750 50  0000 C CNN
F 1 "Fuse" V 5919 2750 50  0000 C CNN
F 2 "Fuse:Fuseholder_Blade_Mini_Keystone_3568" V 5955 2750 50  0001 C CNN
F 3 "~" H 6025 2750 50  0001 C CNN
	1    6025 2750
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F3
U 1 1 60C18B10
P 6025 3250
F 0 "F3" V 5828 3250 50  0000 C CNN
F 1 "Fuse" V 5919 3250 50  0000 C CNN
F 2 "Fuse:Fuseholder_Blade_Mini_Keystone_3568" V 5955 3250 50  0001 C CNN
F 3 "~" H 6025 3250 50  0001 C CNN
	1    6025 3250
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F4
U 1 1 60C19506
P 6025 3750
F 0 "F4" V 5828 3750 50  0000 C CNN
F 1 "Fuse" V 5919 3750 50  0000 C CNN
F 2 "Fuse:Fuseholder_Blade_Mini_Keystone_3568" V 5955 3750 50  0001 C CNN
F 3 "~" H 6025 3750 50  0001 C CNN
	1    6025 3750
	0    1    1    0   
$EndComp
$Comp
L Device:Fuse F6
U 1 1 60C1A03E
P 6025 4750
F 0 "F6" V 5828 4750 50  0000 C CNN
F 1 "Fuse" V 5919 4750 50  0000 C CNN
F 2 "Fuse:Fuseholder_Blade_Mini_Keystone_3568" V 5955 4750 50  0001 C CNN
F 3 "~" H 6025 4750 50  0001 C CNN
	1    6025 4750
	0    1    1    0   
$EndComp
Text Label 7100 2750 2    50   ~ 0
control_systems_supply
Wire Wire Line
	6175 2750 7100 2750
Text Label 7075 3250 2    50   ~ 0
cooling_supply
Wire Wire Line
	6175 3250 7075 3250
Text Label 7075 3750 2    50   ~ 0
inverter_supply
Wire Wire Line
	6175 3750 7075 3750
Text Label 4525 2250 0    50   ~ 0
LV_power_distribution_board_supply
Wire Wire Line
	5875 2250 4525 2250
$Comp
L Device:Fuse F1
U 1 1 60BD49BD
P 6025 2250
F 0 "F1" V 5828 2250 50  0000 C CNN
F 1 "Master fuse" V 5919 2250 50  0000 C CNN
F 2 "Fuse:Fuseholder_Blade_Mini_Keystone_3568" V 5955 2250 50  0001 C CNN
F 3 "~" H 6025 2250 50  0001 C CNN
	1    6025 2250
	0    1    1    0   
$EndComp
Text Label 7650 2250 2    50   ~ 0
fused_power_distribution_board_supply
Wire Wire Line
	6175 2250 7650 2250
Text Label 4400 2750 0    50   ~ 0
fused_power_distribution_board_supply
Wire Wire Line
	4400 2750 5875 2750
Text Label 4400 3250 0    50   ~ 0
fused_power_distribution_board_supply
Wire Wire Line
	4400 3250 5875 3250
Text Label 4400 3750 0    50   ~ 0
fused_power_distribution_board_supply
Wire Wire Line
	4400 3750 5875 3750
Text Label 4500 4750 0    50   ~ 0
LV_ASMS
Wire Wire Line
	5875 4750 4500 4750
Text Label 7075 4750 2    50   ~ 0
DV_actuator_supply
Wire Wire Line
	6175 4750 7075 4750
Text Notes 2075 4175 0    50   ~ 0
note: RES 2 is recieved signal from the RES
$Comp
L Device:Fuse F5
U 1 1 60BF1C82
P 6025 4250
F 0 "F5" V 5828 4250 50  0000 C CNN
F 1 "Fuse" V 5919 4250 50  0000 C CNN
F 2 "Fuse:Fuseholder_Blade_Mini_Keystone_3568" V 5955 4250 50  0001 C CNN
F 3 "~" H 6025 4250 50  0001 C CNN
	1    6025 4250
	0    1    1    0   
$EndComp
Text Label 4400 4250 0    50   ~ 0
fused_power_distribution_board_supply
Wire Wire Line
	4400 4250 5875 4250
Text Label 7075 4250 2    50   ~ 0
SC_fuse_RES
Wire Wire Line
	6175 4250 7075 4250
Wire Wire Line
	9125 2550 10025 2550
Wire Wire Line
	9125 2950 10025 2950
Wire Wire Line
	9125 3150 10025 3150
Wire Wire Line
	9125 3350 10025 3350
Text Label 4400 5500 0    50   ~ 0
LV_power_distribution_board_gnd
Text Label 7150 5600 2    50   ~ 0
SC_GND
Text Label 7150 5400 2    50   ~ 0
cooling_gnd
Text Label 7150 5300 2    50   ~ 0
control_systems_gnd
Text Label 7150 5500 2    50   ~ 0
inverter_gnd
Text Label 7150 5700 2    50   ~ 0
DV_actuator_gnd
Wire Wire Line
	6000 5300 6000 5400
Wire Wire Line
	4400 5500 6000 5500
Wire Wire Line
	6000 5300 7150 5300
Wire Wire Line
	6000 5400 7150 5400
Connection ~ 6000 5400
Wire Wire Line
	6000 5400 6000 5500
Wire Wire Line
	6000 5500 7150 5500
Connection ~ 6000 5500
Wire Wire Line
	6000 5600 6000 5500
Wire Wire Line
	6000 5600 7150 5600
Wire Wire Line
	6000 5700 6000 5600
Wire Wire Line
	6000 5700 7150 5700
Connection ~ 6000 5600
Text Label 3150 3125 2    50   ~ 0
fused_power_distribution_board_supply
Wire Wire Line
	1700 3125 3150 3125
Wire Wire Line
	1700 3225 3150 3225
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60C20398
P 4400 5500
F 0 "#FLG0101" H 4400 5575 50  0001 C CNN
F 1 "PWR_FLAG" V 4400 5627 50  0000 L CNN
F 2 "" H 4400 5500 50  0001 C CNN
F 3 "~" H 4400 5500 50  0001 C CNN
	1    4400 5500
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
