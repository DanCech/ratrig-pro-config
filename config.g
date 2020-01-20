; Configuration file for Duet 3 (firmware version 3)
; executed by the firmware on start-up

; General preferences
G90                                          ; send absolute coordinates...
M83                                          ; ...but relative extruder moves
M550 P"Duet 3"                               ; set printer name

M667 S1                                      ; select CoreXY mode

; Drives
M569 P0.0 S0                                 ; physical drive 0.0 goes backwards
M569 P0.1 S0                                 ; physical drive 0.1 goes backwards
M569 P0.2 S0                                 ; physical drive 0.2 goes backwards
M569 P0.3 S1                                 ; physical drive 0.3 goes forwards
M569 P0.4 S1                                 ; physical drive 0.4 goes forwards
M569 P0.5 S1                                 ; physical drive 0.5 goes forwards
M584 X0.4 Y0.3 Z0.0:0.1:0.2 E0.5             ; set drive mapping
M350 X16 Y16 Z16 E16 I1                      ; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E142.90            ; set steps per mm
M566 X900.00 Y900.00 Z12.00 E120.00          ; set maximum instantaneous speed changes (mm/min)
M203 X6000.00 Y6000.00 Z180.00 E1200.00      ; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z20.00 E250.00          ; set accelerations (mm/s^2)
M906 X800 Y800 Z800 E800 I30                 ; set motor currents (mA) and motor idle factor in per cent
M84 S30                                      ; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                             ; set axis minima
M208 X300 Y300 Z300 S0                       ; set axis maxima

; Endstops
M574 X1 S3                                   ; configure sensorless endstop for low end on X
M574 Y1 S3                                   ; configure sensorless endstop for low end on Y
M574 Z1 S2                                   ; configure Z-probe endstop for low end on Z

; Z leadscrew positions
M671 X332:-32:150 Y90:90:370 S10             ; right, left, back

; Z-Probe
M950 S0 C"io7.out"                           ; create servo pin 0 for BLTouch
M558 P9 C"io7.in" H5 F120 T6000              ; set Z probe type to bltouch and the dive height + speeds
G31 P500 X27 Y1 Z3.7                         ; set Z probe trigger value, offset and trigger height
M557 X30:270 Y10:290 S40                     ; define mesh grid

; Heaters
M308 S0 P"temp0" Y"thermistor" T100000 B4138 ; configure sensor 0 as thermistor on pin temp0
M950 H0 C"out0" T0                           ; create bed heater output on out0 and map it to sensor 0
M143 H0 S120                                 ; set temperature limit for heater 0 to 120C
M307 H0 A255.6 C558.3 D1.8 B0 S1.00          ; disable bang-bang mode for the bed heater and set PWM limit and PID settings
M140 H0                                      ; map heated bed to heater 0

M308 S1 P"temp1" Y"thermistor" A"Volcano" T100000 B4138 ; configure sensor 1 as thermistor on pin temp1
M950 H1 C"out1" T1                           ; create nozzle heater output on out1 and map it to sensor 1
M143 H1 S285                                 ; set temperature limit for heater 1 to 285C
M307 H1 A384.5 C364.6 D3.3 B0 S1.00          ; disable bang-bang mode for the nozzle heater and set PWM limit and PID settings

; Fans
M950 F0 C"out7" Q100                         ; create fan 0 on pin out7 and set its frequency
M106 P0 S0 L1.0 X1.0 H1 T50                  ; set fan 0 value. Thermostatic control based on hotend

; Tools
M563 P0 S"Volcano" D0 H1 F0                  ; define tool 0
G10 P0 X0 Y0 Z0                              ; set tool 0 axis offsets
G10 P0 R0 S0                                 ; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

; Miscellaneous
