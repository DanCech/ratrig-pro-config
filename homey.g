; homey.g
; called to home the Y axis

M400                    ; make sure everything has stopped before we make changes

M574 X1 Y1 S3           ; set endstops to use motor stall
M913 X75 Y75            ; drop motor currents to 75%
M915 X Y S2 F0 R0       ; set sensitivity to +2 unfiltered

G91                     ; use relative positioning

G1 H2 Z5 F6000          ; lift Z relative to current position

G1 H1 Y-400 F2500       ; move Y all the way forward and stop at end

G1 Y5                   ; move to edge of glass
G92 Y0                  ; set Y0 at edge of glass

G1 H2 Z-5 F6000         ; lower Z again

G90                     ; back to absolute positioning
M400                    ; make sure everything has stopped before we reset the motor currents
M913 X100 Y100          ; motor currents back to 100%
M915 X Y S5 F0 R2       ; set sensitivity to +5 and enable auto-pause