; bed.g
; called to perform automatic bed compensation via G32

M561 ; clear any bed transform

G30 P0 X30 Y30 Z-99999      ; probe near front left corner
G30 P1 X150 Y30 Z-99999     ; probe near front center
G30 P2 X270 Y30 Z-99999     ; probe near front right corner
G30 P3 X270 Y150 Z-99999    ; probe near center right
G30 P4 X270 Y270 Z-99999    ; probe near rear right corner
G30 P5 X150 Y270 Z-99999    ; probe near rear center
G30 P6 X30 Y270 Z-99999     ; probe near rear left corner
G30 P7 X30 Y150 Z-99999     ; probe near center left
G30 P8 X150 Y150 Z-99999 S3 ; probe near center and calibrate 3 motors

; G29  ; probe the bed and enable compensation
