;Testing eject code


{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+30, max_print_height)}{endif} ; Move print head up
G0 X100 Y100 F3000 ; home X axis

M104 S0 ; turn off extruder 
M140 S0 ; turn off heatbed

M106 S255; fan to 100%

G4 ;vibe 
G90 ;Absolute positioning 

G0 X100 Y0 F5000
{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+10, max_print_height)}{endif} ; Move print head up

{if filament_type[0] == "PLA"}
;PLA
M190 R40 ; Wait for bed to cool
M400
G4 S15; vibe
M190 R39
M400
G4 S15
M190 R38
M400
G4 ; vibe
M106 S0; fan to 0%
;endPLA
{endif}



{if filament_type[0] == "PET"}
;PETG
M190 R32 ; Wait for bed to cool
M400
G4 S15; vibe
M190 R31
M400
G4 S15
M190 R30
M400
G4 ; vibe
G4 S600
M106 S0; fan to 0%
;endPETG
{endif}


{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+10, max_print_height)}{endif} ; Move print head up
G0 X100.000 Y195.000 F5000; move into position 

G0 Z1.000 F1000 ; Lower Gantry 

;Left Tab Push
G0 Y162 F3000
G0 X36 F2000
G4
G0 X28.5 F500 ;push to free

;Right Tab Push
G0 Y162 F3000
G0 X165 F2000
G4
G0 X172.5 F500 ;push to free

G0 X100 F5000 ;reset

G1 Z20
G28 X0;reset to do tab push again

G0 X100.000 Y195.000 F5000; move into position 

G0 Z1.000 F1000 ; Lower Gantry 

;Left Tab Push
G0 Y162 F3000
G0 X36 F2000
G4
G0 X28.5 F500 ;push to free

;Right Tab Push
G0 Y162 F3000
G0 X165 F2000
G4
G0 X172.5 F500 ;push to free

G0 X100 F5000 ;reset

G0 X100 Y0 F2000 ; crash into it
G4 ; vibe a bit more
G1 Y1 F8000
{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+5, max_print_height)} F1000{endif} ; Move print head up
G28 Y0
G0 Y195 F2000
G1 Z1 F1000
G0 Y0 F7000 ; Push it out and off into the bin
G4 ; vibe a bit more
G0 Y195 F2000 ; Push to bin
;Clear bed
G0 Z5 F1000
G0 X5 F5000
G0 Y0 F2000
G0 Y195 F5000
G0 X195 Z5 F5000
G0 Y0 F2000
G0 Y195 F5000

;shutdown 
M84 ; disable motors
M107 ; turn off fan
M104 S0 ; turn off extruder 
M140 S0 ; turn off heatbed
