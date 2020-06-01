;start Start G-code First

M83  ; extruder relative mode
M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S[first_layer_temperature] ; wait for extruder temp

M280 P0 S160 ; reset alarm on BLTouch
G4 P100 ; delay for BLTouch
G28 ; HOME
G29 ; BED LEVEL
;My custom gcode
G92 E0 ; reset extruder distance
M420 S1 ;ENABLE BED LEVELING
G1 Z1 ; lift head
G1 Y5 E2.8 F600
M73 P0 R98
G1 Y10 E3.8 F600
G92 E0 ; reset extruder distance
G1 Y60 E18 F600.0 ; intro line
G1 Y93.3333 E25 F600.0 ; intro line
G92 E0 ; reset extruder distance
G1 E-0.5 F500 ; retract
G1 X1.0 F3000.0 ; grab melted filament off the nozzle
G1 Z3.4 ; grab melted filament off the nozzle
;G1 E-2 F200 ; Move filament down
G92 E0 ; reset extruder distance
G1 Z1.2 F200
G1 Y1 F5000
G28 X0
G28 Y0 
G92 X0
G92 Y0
M420 S1 ;ENABLE BED LEVELING

;end Start G-code First