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
L power:+VDC #PWR0101
U 1 1 6021E48A
P 2250 2450
F 0 "#PWR0101" H 2250 2350 50  0001 C CNN
F 1 "+VDC" H 2250 2725 50  0000 C CNN
F 2 "" H 2250 2450 50  0001 C CNN
F 3 "" H 2250 2450 50  0001 C CNN
	1    2250 2450
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 6021ED01
P 2600 2350
F 0 "#PWR0102" H 2600 2100 50  0001 C CNN
F 1 "GND" H 2605 2177 50  0000 C CNN
F 2 "" H 2600 2350 50  0001 C CNN
F 3 "" H 2600 2350 50  0001 C CNN
	1    2600 2350
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J1
U 1 1 6021F844
P 3600 2600
F 0 "J1" H 3680 2592 50  0000 L CNN
F 1 "VREG" H 3680 2501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3600 2600 50  0001 C CNN
F 3 "~" H 3600 2600 50  0001 C CNN
	1    3600 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2250 2700 2500 2700
Wire Wire Line
	2250 2450 2250 2700
Wire Wire Line
	2600 2350 2600 2600
Wire Wire Line
	2600 2600 2850 2600
$Comp
L Connector_Generic:Conn_01x02 O1
U 1 1 6022346E
P 4350 2600
F 0 "O1" H 4430 2592 50  0000 L CNN
F 1 "VOUT" H 4430 2501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4350 2600 50  0001 C CNN
F 3 "~" H 4350 2600 50  0001 C CNN
	1    4350 2600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3400 2500 3400 2300
Wire Wire Line
	3400 2300 3950 2300
Wire Wire Line
	3950 2300 3950 2700
Wire Wire Line
	3950 2700 4150 2700
Wire Wire Line
	3250 2600 3250 2150
Wire Wire Line
	3250 2150 4150 2150
Wire Wire Line
	4150 2150 4150 2600
Connection ~ 3250 2600
Wire Wire Line
	3250 2600 3400 2600
$Comp
L Connector_Generic:Conn_01x02 O2
U 1 1 60228E70
P 4350 3400
F 0 "O2" H 4430 3392 50  0000 L CNN
F 1 "VOUT" H 4430 3301 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4350 3400 50  0001 C CNN
F 3 "~" H 4350 3400 50  0001 C CNN
	1    4350 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J2
U 1 1 60228E69
P 3600 3400
F 0 "J2" H 3680 3392 50  0000 L CNN
F 1 "VREG" H 3680 3301 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3600 3400 50  0001 C CNN
F 3 "~" H 3600 3400 50  0001 C CNN
	1    3600 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 O3
U 1 1 6022CBA4
P 4350 4100
F 0 "O3" H 4430 4092 50  0000 L CNN
F 1 "VOUT" H 4430 4001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4350 4100 50  0001 C CNN
F 3 "~" H 4350 4100 50  0001 C CNN
	1    4350 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J3
U 1 1 6022CBAA
P 3600 4100
F 0 "J3" H 3680 4092 50  0000 L CNN
F 1 "VREG" H 3680 4001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3600 4100 50  0001 C CNN
F 3 "~" H 3600 4100 50  0001 C CNN
	1    3600 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 O4
U 1 1 6022DB71
P 4350 4800
F 0 "O4" H 4430 4792 50  0000 L CNN
F 1 "VOUT" H 4430 4701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4350 4800 50  0001 C CNN
F 3 "~" H 4350 4800 50  0001 C CNN
	1    4350 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 6022DB77
P 3600 4800
F 0 "J4" H 3680 4792 50  0000 L CNN
F 1 "VREG" H 3680 4701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3600 4800 50  0001 C CNN
F 3 "~" H 3600 4800 50  0001 C CNN
	1    3600 4800
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 O5
U 1 1 6022EE0E
P 4350 5600
F 0 "O5" H 4430 5592 50  0000 L CNN
F 1 "VOUT" H 4430 5501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4350 5600 50  0001 C CNN
F 3 "~" H 4350 5600 50  0001 C CNN
	1    4350 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J5
U 1 1 6022EE14
P 3600 5600
F 0 "J5" H 3680 5592 50  0000 L CNN
F 1 "VREG" H 3680 5501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3600 5600 50  0001 C CNN
F 3 "~" H 3600 5600 50  0001 C CNN
	1    3600 5600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 O6
U 1 1 602300AF
P 4350 6300
F 0 "O6" H 4430 6292 50  0000 L CNN
F 1 "VOUT" H 4430 6201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 4350 6300 50  0001 C CNN
F 3 "~" H 4350 6300 50  0001 C CNN
	1    4350 6300
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 602300B5
P 3600 6300
F 0 "J6" H 3680 6292 50  0000 L CNN
F 1 "VREG" H 3680 6201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 3600 6300 50  0001 C CNN
F 3 "~" H 3600 6300 50  0001 C CNN
	1    3600 6300
	1    0    0    -1  
$EndComp
Wire Wire Line
	3250 2600 3250 3000
Wire Wire Line
	3250 3400 3400 3400
Wire Wire Line
	3250 3400 3250 3750
Wire Wire Line
	3250 4100 3400 4100
Connection ~ 3250 3400
Wire Wire Line
	3250 4100 3250 4450
Wire Wire Line
	3250 4800 3400 4800
Connection ~ 3250 4100
Wire Wire Line
	3250 4800 3250 5300
Wire Wire Line
	3250 5600 3400 5600
Connection ~ 3250 4800
Wire Wire Line
	3250 5600 3250 6000
Wire Wire Line
	3250 6300 3400 6300
Connection ~ 3250 5600
Wire Wire Line
	3050 2700 3050 3500
Wire Wire Line
	3050 3500 3400 3500
Connection ~ 3050 2700
Wire Wire Line
	3050 2700 3400 2700
Wire Wire Line
	3050 3500 3050 4200
Wire Wire Line
	3050 4200 3400 4200
Connection ~ 3050 3500
Wire Wire Line
	3050 4200 3050 4900
Wire Wire Line
	3050 4900 3400 4900
Connection ~ 3050 4200
Wire Wire Line
	3050 4900 3050 5700
Wire Wire Line
	3050 5700 3400 5700
Connection ~ 3050 4900
Wire Wire Line
	3050 5700 3050 6400
Wire Wire Line
	3050 6400 3400 6400
Connection ~ 3050 5700
Wire Wire Line
	3400 3300 3400 3100
Wire Wire Line
	3400 3100 4000 3100
Wire Wire Line
	4000 3100 4000 3500
Wire Wire Line
	4000 3500 4150 3500
Wire Wire Line
	3400 4000 3400 3850
Wire Wire Line
	3400 3850 4000 3850
Wire Wire Line
	4000 3850 4000 4200
Wire Wire Line
	4000 4200 4150 4200
Wire Wire Line
	3250 3000 4150 3000
Wire Wire Line
	4150 3000 4150 3400
Connection ~ 3250 3000
Wire Wire Line
	3250 3000 3250 3400
Wire Wire Line
	3250 3750 4150 3750
Wire Wire Line
	4150 3750 4150 4100
Connection ~ 3250 3750
Wire Wire Line
	3250 3750 3250 4100
Wire Wire Line
	3400 4700 3400 4500
Wire Wire Line
	3400 4500 3950 4500
Wire Wire Line
	3950 4500 3950 4900
Wire Wire Line
	3950 4900 4150 4900
Wire Wire Line
	3400 5500 3400 5350
Wire Wire Line
	3400 5350 3950 5350
Wire Wire Line
	3950 5350 3950 5700
Wire Wire Line
	3950 5700 4150 5700
Wire Wire Line
	3400 6200 3400 6050
Wire Wire Line
	3400 6050 3900 6050
Wire Wire Line
	3900 6050 3900 6400
Wire Wire Line
	3900 6400 4150 6400
Wire Wire Line
	3250 4450 4150 4450
Wire Wire Line
	4150 4450 4150 4800
Connection ~ 3250 4450
Wire Wire Line
	3250 4450 3250 4800
Wire Wire Line
	3250 5300 4150 5300
Wire Wire Line
	4150 5300 4150 5600
Connection ~ 3250 5300
Wire Wire Line
	3250 5300 3250 5600
Wire Wire Line
	3250 6000 4150 6000
Wire Wire Line
	4150 6000 4150 6300
Connection ~ 3250 6000
Wire Wire Line
	3250 6000 3250 6300
$Comp
L Connector_Generic:Conn_01x02 VIN1
U 1 1 6024770A
P 2600 3000
F 0 "VIN1" V 2472 3080 50  0000 L CNN
F 1 "VIN" V 2563 3080 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x06_P2.54mm_Vertical" H 2600 3000 50  0001 C CNN
F 3 "~" H 2600 3000 50  0001 C CNN
	1    2600 3000
	0    1    1    0   
$EndComp
Wire Wire Line
	2500 2800 2500 2700
Connection ~ 2500 2700
Wire Wire Line
	2500 2700 3050 2700
Wire Wire Line
	2600 2800 2850 2800
Wire Wire Line
	2850 2800 2850 2600
Connection ~ 2850 2600
Wire Wire Line
	2850 2600 3250 2600
$EndSCHEMATC
