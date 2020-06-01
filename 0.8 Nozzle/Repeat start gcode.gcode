;start Start G-code repeat

M83  ; extruder relative mode
M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp
M190 S[first_layer_bed_temperature] ; wait for bed temp
M109 S[first_layer_temperature] ; wait for extruder temp

M280 P0 S160 ; reset alarm on BLTouch
G4 P100 ; delay for BLTouch
G28 ; HOME
G29 ; BED LEVEL
M400 ;complete everything before
G0 X5 Y5 F6000
;My custom gcode
M420 S1 ;ENABLE BED LEVELING
G1 Z1 ; lift head
G1 Y5 F600
G1 Y10 F600
G1 Y60 F600.0 ; intro line
G1 Y93.3333 F600.0 ; intro line
M420 S1 ;ENABLE BED LEVELING

;end Start G-code repeat