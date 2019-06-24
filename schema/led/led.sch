EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:ESP8266
LIBS:AMS1117
LIBS:led-cache
EELAYER 25 0
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
L ESP-01v090 U?
U 1 1 593CF642
P 7100 2000
F 0 "U?" H 7100 1900 50  0000 C CNN
F 1 "ESP-01v090" H 7100 2100 50  0000 C CNN
F 2 "" H 7100 2000 50  0001 C CNN
F 3 "" H 7100 2000 50  0001 C CNN
	1    7100 2000
	0    -1   -1   0   
$EndComp
$Comp
L AMS1117 U
U 1 1 593CF8C2
P 6050 2050
F 0 "U" H 6050 1950 50  0000 C CNN
F 1 "AMS1117" H 6050 2150 50  0000 C CNN
F 2 "" H 6050 2050 60  0001 C CNN
F 3 "" H 6050 2050 60  0001 C CNN
	1    6050 2050
	0    1    1    0   
$EndComp
$Comp
L CP C
U 1 1 593CFE59
P 5550 1550
F 0 "C" H 5575 1650 50  0000 L CNN
F 1 "10uF" H 5575 1450 50  0000 L CNN
F 2 "" H 5588 1400 50  0000 C CNN
F 3 "" H 5550 1550 50  0000 C CNN
	1    5550 1550
	1    0    0    -1  
$EndComp
$Comp
L +5V #PWR?
U 1 1 593D002B
P 4750 1850
F 0 "#PWR?" H 4750 1700 50  0001 C CNN
F 1 "+5V" H 4750 1990 50  0000 C CNN
F 2 "" H 4750 1850 50  0000 C CNN
F 3 "" H 4750 1850 50  0000 C CNN
	1    4750 1850
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR?
U 1 1 593D0055
P 4750 2250
F 0 "#PWR?" H 4750 2000 50  0001 C CNN
F 1 "GND" H 4750 2100 50  0000 C CNN
F 2 "" H 4750 2250 50  0000 C CNN
F 3 "" H 4750 2250 50  0000 C CNN
	1    4750 2250
	0    1    1    0   
$EndComp
$Comp
L C Cnon
U 1 1 593D053A
P 6300 2850
F 0 "Cnon" H 6325 2950 50  0000 L CNN
F 1 "104" H 6325 2750 50  0000 L CNN
F 2 "" H 6338 2700 50  0000 C CNN
F 3 "" H 6300 2850 50  0000 C CNN
	1    6300 2850
	0    -1   -1   0   
$EndComp
$Comp
L USB_OTG P?
U 1 1 593D042A
P 5150 2050
F 0 "P?" H 5475 1925 50  0000 C CNN
F 1 "USB_OTG" H 5150 2250 50  0000 C CNN
F 2 "" V 5100 1950 50  0000 C CNN
F 3 "" V 5100 1950 50  0000 C CNN
	1    5150 2050
	0    1    1    0   
$EndComp
$Comp
L R R1
U 1 1 593D085C
P 5800 850
F 0 "R1" V 5880 850 50  0000 C CNN
F 1 "10k" V 5800 850 50  0000 C CNN
F 2 "" V 5730 850 50  0000 C CNN
F 3 "" H 5800 850 50  0000 C CNN
	1    5800 850 
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 593D08F3
P 5800 1050
F 0 "R2" V 5880 1050 50  0000 C CNN
F 1 "10k" V 5800 1050 50  0000 C CNN
F 2 "" V 5730 1050 50  0000 C CNN
F 3 "" H 5800 1050 50  0000 C CNN
	1    5800 1050
	0    1    1    0   
$EndComp
$Comp
L LED_RCBG D?
U 1 1 593D0C75
P 8050 2050
F 0 "D?" H 8050 2400 50  0000 C CNN
F 1 "LED_RCBG" H 8050 1700 50  0000 C CNN
F 2 "" H 8050 2000 50  0000 C CNN
F 3 "" H 8050 2000 50  0000 C CNN
	1    8050 2050
	-1   0    0    1   
$EndComp
$Comp
L R R3
U 1 1 593D0ECF
P 8050 2850
F 0 "R3" V 8130 2850 50  0000 C CNN
F 1 "220" V 8050 2850 50  0000 C CNN
F 2 "" V 7980 2850 50  0000 C CNN
F 3 "" H 8050 2850 50  0000 C CNN
	1    8050 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4800 2500 5550 2500
Wire Wire Line
	5550 1700 5550 3300
Wire Wire Line
	4800 1250 6050 1250
Wire Wire Line
	5550 1050 5550 1400
Connection ~ 5550 1250
Connection ~ 5550 2050
Wire Wire Line
	6050 2850 6050 3100
Wire Wire Line
	6050 3100 7250 3100
Wire Wire Line
	7250 3100 7250 2950
Wire Wire Line
	5550 3000 6600 3000
Wire Wire Line
	6600 3000 6600 1050
Wire Wire Line
	6600 1050 6950 1050
Connection ~ 5550 2500
Wire Wire Line
	6150 2850 6050 2850
Wire Wire Line
	6450 2850 6600 2850
Connection ~ 6600 2850
Connection ~ 6600 1900
Wire Wire Line
	4750 2250 4850 2250
Wire Wire Line
	4750 1850 4850 1850
Connection ~ 4800 2250
Connection ~ 4800 1850
Wire Wire Line
	4800 2250 4800 2500
Wire Wire Line
	4800 1250 4800 1850
Wire Wire Line
	7050 1050 7050 1000
Wire Wire Line
	6100 1000 7600 1000
Wire Wire Line
	6100 1000 6100 1050
Wire Wire Line
	6100 1050 5950 1050
Wire Wire Line
	7150 1050 7150 850 
Wire Wire Line
	5950 850  7700 850 
Wire Wire Line
	5650 1050 5550 1050
Wire Wire Line
	5650 850  5550 850 
Wire Wire Line
	5550 850  5550 1250
Wire Wire Line
	6950 2950 6950 3200
Wire Wire Line
	6950 3200 7750 3200
Wire Wire Line
	7750 3200 7750 2250
Wire Wire Line
	7600 1000 7600 2050
Wire Wire Line
	7600 2050 7750 2050
Connection ~ 7050 1000
Wire Wire Line
	7700 1850 7750 1850
Wire Wire Line
	8350 2050 8350 2550
Wire Wire Line
	8350 2550 8050 2550
Wire Wire Line
	8050 2550 8050 2700
Wire Wire Line
	8050 3000 8050 3300
Wire Wire Line
	8050 3300 5550 3300
Connection ~ 5550 3000
Wire Wire Line
	7700 850  7700 1850
Connection ~ 7150 850 
$EndSCHEMATC
