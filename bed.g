; bed.g
; called to perform automatic bed compensation via G32

M561 ; clear any bed transform

G30 P0 X0 Y40 Z-99999       ; probe near front left corner
G30 P1 X0 Y270 Z-99999      ; probe near rear left corner
G30 P2 X270 Y155 Z-99999 S3 ; probe near center right and calibrate 3 motors

; G29  ; probe the bed and enable compensation

; G1 X170 Y155 F9000      ; go to first bed probe point and home Z
; G30                     ; home Z by probing the bed
