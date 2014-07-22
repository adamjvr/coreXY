// Endstop Holder
// Author: sdavi


include <configuration.scad>
include <dimensions.scad>

//switch_length = 20;
//switch_width = 10.5;

//switch_holes = [5, 15];


//endstop_holder(diameter=8);
//translate([0,22,0]) endstop(8);
//translate([0,44,0]) endstop(12);


module endstop_holder(diameter=8){

	holder_thickness=4;


	difference(){
		union(){
			cylinder(d=diameter+holder_thickness*2, h=switch_width, $fn=60);
			//extra for fixing nut/screw
			translate([-(diameter+holder_thickness*2)/2,0,0])
				cube([diameter+holder_thickness*2, diameter/2+15, switch_width]);			
			//switch arm
			translate([-(diameter+holder_thickness*2)/2, -(diameter+holder_thickness*2)/2-1-switch_length,0])
				cube([holder_thickness, (diameter+holder_thickness*2)/2+1+switch_length, switch_width]);

			//extra for nut trap
			translate([(diameter+holder_thickness*2)/2,diameter/2+15-(m3_nut_diameter_horizontal+5.5),0])
				cube([1.5, m3_nut_diameter_horizontal+5.5, switch_width]);

	    }

		//cut for rod
		cylinder(d=diameter, h=switch_width, $fn=60);
		//cut slot in end 
		translate([-diameter/2+1.5/2,0,0])
			cube([diameter-1.5, diameter/2+15, switch_width]);


		//switch mounting holes
		translate([-(diameter+holder_thickness*2)/2-0.1, -(diameter+holder_thickness*2)/2-1-switch_length,switch_width/2]){

			for(y=switch_holes){
				translate([0,y,0]) rotate([0,90,0]) cylinder(d=M3, h=holder_thickness+0.2, $fn=60); 
			}

		}

		//screw to secure holder
		translate([-(diameter+holder_thickness*2)/2-0.1,diameter/2+15/2,switch_width/2])
			rotate([0,90,0])cylinder(d=M3, h=diameter+holder_thickness*2+0.2, $fn=60);
		//nut trap
		translate([(diameter+holder_thickness*2)/2+1.5-3,diameter/2+15/2,switch_width/2])
			rotate([0,90,0]) cylinder(d=m3_nut_diameter_horizontal, h=3+0.1, $fn=6);


    }
}

