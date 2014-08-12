// y_motor end spacer
// Author: sdavi


include <lib/y_motor_end.scad>

translate([5,0,0])motor_mount();
mirror([1,0,0])motor_mount();
