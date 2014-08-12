// y_idler end
// Author: sdavi

include <lib/y_idler_end.scad>


translate([5,0,0]) y_rod_holder();
mirror([1,0,0]) y_rod_holder();

translate([5,25,0]) y_rod_holder();
translate([0,25,0]) mirror([1,0,0]) y_rod_holder();






