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
$Comp
L Connector:Conn_01x02_Male J1
U 1 1 5E90A16B
P 2850 2150
F 0 "J1" H 2822 2124 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2822 2033 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_angle_2" H 2850 2150 50  0001 C CNN
F 3 "~" H 2850 2150 50  0001 C CNN
	1    2850 2150
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J7
U 1 1 5E90E784
P 9000 3800
F 0 "J7" H 8972 3682 50  0000 R CNN
F 1 "Conn_01x02_Male" H 8972 3773 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_vert_2" H 9000 3800 50  0001 C CNN
F 3 "~" H 9000 3800 50  0001 C CNN
	1    9000 3800
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J8
U 1 1 5E90ECE1
P 9000 4350
F 0 "J8" H 8972 4324 50  0000 R CNN
F 1 "Conn_01x02_Male" H 8972 4233 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_vert_2" H 9000 4350 50  0001 C CNN
F 3 "~" H 9000 4350 50  0001 C CNN
	1    9000 4350
	-1   0    0    1   
$EndComp
Wire Wire Line
	8800 2900 7800 2900
Wire Wire Line
	8800 3000 7800 3000
Wire Wire Line
	8800 3350 7800 3350
Wire Wire Line
	8800 3450 7800 3450
Wire Wire Line
	3050 2250 4500 2250
Wire Wire Line
	3050 2650 4000 2650
Wire Wire Line
	3050 2750 4000 2750
Wire Wire Line
	8800 3800 7800 3800
Wire Wire Line
	8800 3900 7800 3900
Wire Wire Line
	7800 4250 8800 4250
Wire Wire Line
	8800 4350 7800 4350
Text Label 4500 2150 2    50   ~ 0
AIR+_vehicle_side
Text Label 4000 2750 2    50   ~ 0
AIR+_fuse_side
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5E931353
P 9050 2350
F 0 "J4" H 9022 2374 50  0000 R CNN
F 1 "Conn_01x03_Male" H 9022 2283 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_angle_3" H 9050 2350 50  0001 C CNN
F 3 "~" H 9050 2350 50  0001 C CNN
	1    9050 2350
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J3
U 1 1 5E93043B
P 2850 3150
F 0 "J3" H 2822 3124 50  0000 R CNN
F 1 "Conn_01x02_Male" H 2822 3033 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_angle_2" H 2850 3150 50  0001 C CNN
F 3 "~" H 2850 3150 50  0001 C CNN
	1    2850 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 3150 4000 3150
Wire Wire Line
	3050 3250 4000 3250
Text Label 4000 3150 2    50   ~ 0
AIR-_vehicle_side
Wire Wire Line
	4000 3150 4000 3250
Text Label 4000 2650 2    50   ~ 0
AIR+_vehicle_side
Text Label 6000 1850 0    50   ~ 0
AIR+_vehicle_side
Text Label 7800 2900 0    50   ~ 0
AIR+_vehicle_side
Text Label 7800 3800 0    50   ~ 0
AIR+_vehicle_side
Text Label 7800 4250 0    50   ~ 0
AIR+_vehicle_side
Text Label 4500 2250 2    50   ~ 0
AIR-_vehicle_side
Text Label 7800 3350 0    50   ~ 0
AIR-_vehicle_side
Text Label 6000 2150 0    50   ~ 0
AIR+_fuse_side
Text Label 7800 4350 0    50   ~ 0
AIR+_fuse_side
$Comp
L Connector:Conn_01x02_Male J5
U 1 1 5E94DAAE
P 9000 2900
F 0 "J5" H 8972 2874 50  0000 R CNN
F 1 "Conn_01x02_Male" H 8972 2783 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC3_angle_2" H 9000 2900 50  0001 C CNN
F 3 "~" H 9000 2900 50  0001 C CNN
	1    9000 2900
	-1   0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x02_Male J6
U 1 1 5E94DF12
P 9000 3350
F 0 "J6" H 8972 3324 50  0000 R CNN
F 1 "Conn_01x02_Male" H 8972 3233 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC3_angle_2" H 9000 3350 50  0001 C CNN
F 3 "~" H 9000 3350 50  0001 C CNN
	1    9000 3350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7800 3350 7800 3450
Text Notes 9800 2400 0    50   ~ 0
to IVT
Text Notes 9800 3000 0    50   ~ 0
to IMD
Wire Wire Line
	7800 2900 7800 3000
Text Label 7800 3900 0    50   ~ 0
AIR-_vehicle_side
Text Notes 9800 3450 0    50   ~ 0
to IMD
Text Notes 9800 3900 0    50   ~ 0
to HV_sensor
Text Notes 9800 4400 0    50   ~ 0
to precharge_HV\n
Text Notes 2000 2200 2    50   ~ 0
to AIL
Text Notes 2000 2750 2    50   ~ 0
from AIR+ and HV fuse
Text Notes 2000 3200 2    50   ~ 0
from AIR-
Text Label 6000 2450 0    50   ~ 0
cells+
$Comp
L Connector:Conn_01x03_Male J2
U 1 1 5F823A6A
P 2850 2750
F 0 "J2" H 2822 2774 50  0000 R CNN
F 1 "Conn_01x03_Male" H 2822 2683 50  0000 R CNN
F 2 "KTHFS:Wurth-MPC4_male_angle_3" H 2850 2750 50  0001 C CNN
F 3 "~" H 2850 2750 50  0001 C CNN
	1    2850 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3050 2850 4000 2850
Text Label 4000 2850 2    50   ~ 0
cells+
$Comp
L Device:Fuse F1
U 1 1 60572C24
P 3500 2150
F 0 "F1" V 3697 2150 50  0000 C CNN
F 1 "200 mA" V 3606 2150 50  0000 C CNN
F 2 "Fuse:Fuse_SunFuse-6HP" V 3430 2150 50  0001 C CNN
F 3 "~" H 3500 2150 50  0001 C CNN
	1    3500 2150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4500 2150 3650 2150
Wire Wire Line
	3050 2150 3350 2150
$Comp
L Device:R R4
U 1 1 60577FF4
P 7950 1850
F 0 "R4" V 7743 1850 50  0000 C CNN
F 1 "100k" V 7834 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 7880 1850 50  0001 C CNN
F 3 "~" H 7950 1850 50  0001 C CNN
	1    7950 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 1850 7400 1850
$Comp
L Device:R R6
U 1 1 6057AD22
P 7950 2150
F 0 "R6" V 7743 2150 50  0000 C CNN
F 1 "100k" V 7834 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 7880 2150 50  0001 C CNN
F 3 "~" H 7950 2150 50  0001 C CNN
	1    7950 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 2150 7400 2150
$Comp
L Device:R R5
U 1 1 6057B3D5
P 7950 2450
F 0 "R5" V 7743 2450 50  0000 C CNN
F 1 "100k" V 7834 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 7880 2450 50  0001 C CNN
F 3 "~" H 7950 2450 50  0001 C CNN
	1    7950 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	7800 2450 7400 2450
$Comp
L Device:R R1
U 1 1 60583AB1
P 7250 1850
F 0 "R1" V 7043 1850 50  0000 C CNN
F 1 "100k" V 7134 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 7180 1850 50  0001 C CNN
F 3 "~" H 7250 1850 50  0001 C CNN
	1    7250 1850
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 1850 6000 1850
$Comp
L Device:R R2
U 1 1 60584066
P 7250 2450
F 0 "R2" V 7043 2450 50  0000 C CNN
F 1 "100k" V 7134 2450 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 7180 2450 50  0001 C CNN
F 3 "~" H 7250 2450 50  0001 C CNN
	1    7250 2450
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 2450 6000 2450
$Comp
L Device:R R3
U 1 1 605846E7
P 7250 2150
F 0 "R3" V 7043 2150 50  0000 C CNN
F 1 "100k" V 7134 2150 50  0000 C CNN
F 2 "Resistor_SMD:R_2512_6332Metric" V 7180 2150 50  0001 C CNN
F 3 "~" H 7250 2150 50  0001 C CNN
	1    7250 2150
	0    1    1    0   
$EndComp
Wire Wire Line
	7100 2150 6000 2150
Wire Wire Line
	8100 2450 8850 2450
Wire Wire Line
	8850 2350 8400 2350
Wire Wire Line
	8400 2350 8400 2150
Wire Wire Line
	8400 2150 8100 2150
Wire Wire Line
	8850 2250 8500 2250
Wire Wire Line
	8500 2250 8500 1850
Wire Wire Line
	8500 1850 8100 1850
Wire Notes Line
	7000 1450 7000 2600
Wire Notes Line
	7000 2600 8200 2600
Wire Notes Line
	8200 2600 8200 1450
Wire Notes Line
	8200 1450 7000 1450
Text Notes 7000 1400 0    50   ~ 0
Current Limiting Resistors\n(in case of short circuit)
$EndSCHEMATC
