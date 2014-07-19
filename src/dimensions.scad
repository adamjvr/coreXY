// Dimensions
// Author: sdavi


LM8UU = [8, 15, 24];//rod diameter,outter diameter, length
LM12UU = [12, 21, 30];
LM12LUU = [12, 21, 57];

BEARING_624 = [4,13,5]; //inner diameter(hole), outter diameter, thickness (http://reprap.org/wiki/Ball_bearing)
BEARING_2x624 = [4, 13, 10]; // 2 624 bearings together, good size for GT2

BEARING_6300 = [10,35,11]; //inner diameter, outer diameter, thickness



GT2_belt_width = 6;
GT2_belt_pitch = 2;
GT2_belt_thickness = 1.38;
GT2_belt_tooth_height = 0.75;  
GT2_belt_tooth_ratio = 0.5;



GT2_pulley_geared_diameter=12.2;//measured from top of tooth to top of tooth opp side// 12.2 is for the 20 tooth pulley

//from metric (prusa i3)
m4_diameter = 4.6;
m4_nut_diameter = 7.6;
m4_nut_diameter_horizontal = 8.15;

m3_diameter = 3.6;
m3_nut_diameter = 5.3;
m3_nut_diameter_horizontal = 6.8;
m3_washer_diameter = 6.9;
//end i3 variables

m5_diameter = 5.5;

//Hex Head M3x30: Head 5.5mm flat to flat, 2.12mm thick
m3_hex_head_diameter = 5.5*2/sqrt(3) + 0.2;

M4 = m4_diameter;
M3 = m3_diameter;
M5 = m5_diameter;
m4_washer_thickness = 0.8; //flat and penny washers
m4_washer_diameter = 9.6;

nema17_holes = 31;// mm between screws
nema17_width = 42; //width
