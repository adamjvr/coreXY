// y_motor end
// Author: sdavi


include <../configuration.scad>
include <../dimensions.scad>

use <y_idler_end.scad>

nema_arm_height = 10;
nema_mount_width = nema17_holes+11;
 


//y_block_length = y_bearing_block_width/2+xy_bearing_distance+belt_bearing[1]/2+nema_mount_width+20;
y_block_length = 30;//big enough to hold 2 frame screws
y_block_width = 60.2; 
y_block_height = 4;


lid_thickness = y_block_height+min_beltbearing_height/2-y_bearing[0]/2-3;

echo("block length:", y_block_length);
echo("block width:", y_block_width);
echo("block height:", y_block_height);

echo("Total Height:", y_block_height*2+min_beltbearing_height);

flange_thickness=1.1; //thickness of flange on bearing


//pulley();
//rotate([0,180,0])nema17();
//%motor_mount();
//y_motor_end_idler();
//%illustration();
//support();

//translate([5,0,0])frame_spacer();
//mirror([1,0,0])frame_spacer();

//translate([5,0,0]) y_motor_end_top();
//mirror([1,0,0])y_motor_end_top();

//y_motor_end_bottom();
//mirror([1,0,0])y_motor_end_bottom();


module illustration(){
		visualise_high = 1; //high (1) or low bearing (0)

//frames
			%color("grey")translate([0,0,0]) 
				cube([20,20,30+min_beltbearing_height+y_block_height*2+frame_spacer_height]);
			%color("grey")%translate([0,0,min_beltbearing_height+y_block_height*2+frame_spacer_height]) cube([100, 20,20]);
			%color("grey")%translate([0,0,min_beltbearing_height+y_block_height*2+frame_spacer_height]) cube([20,150, 20]);

//bearings
	
		%color("green")translate(inner_bearing_pos)
			translate([0,0,y_block_height+m4_washer_thickness]){ 
				if( visualise_high == 0){
					cylinder(d=belt_bearing[1], h=belt_bearing[2], $fn=60); //bottom
				} else {

					translate([0,0,belt_bearing[2]+m4_washer_thickness*2])
						cylinder(d=belt_bearing[1], h=belt_bearing[2], $fn=60); //top
				}
			}

		%color("green")translate(outer_bearing_pos)
			translate([0,0,y_block_height+m4_washer_thickness]) {
					
				if(visualise_high == 0){
					cylinder(d=belt_bearing[1], h=belt_bearing[2], $fn=60);//bottom	

				} else {
					translate([0,0,belt_bearing[2]+m4_washer_thickness*2])
						cylinder(d=belt_bearing[1], h=belt_bearing[2], $fn=60); //top				
				}

			}

//nema17
		%color("yellow") rotate([0,180,0])
			translate([	-nema17_width/2-20,
							nema17_width/2+20+50,
							-(min_beltbearing_height+y_block_height*2+frame_spacer_height)-20-8]) 
			nema17();	
			
		%translate([nema17_width/2+20,nema17_width/2+20+50,y_block_height+m4_washer_thickness+belt_bearing[2]/2 + visualise_high*(belt_bearing[2]+m4_washer_thickness*2)])
			pulley(bottom=visualise_high);

//belts
		%color("DimGray") translate(inner_bearing_pos) 
			translate([-belt_bearing[2]/2-GT2_belt_thickness,0,y_block_height+m4_washer_thickness+belt_bearing[2]/2-GT2_belt_width/2 +visualise_high*(belt_bearing[2]+m4_washer_thickness*2)]) cube([GT2_belt_thickness, 50, GT2_belt_width]);
		

	//rod holder 
	%color("red")translate([20,0,y_block_height*2+min_beltbearing_height+frame_spacer_height])mirror([0,0,1])y_rod_holder();

}





//modle of nema17 for illustration
module nema17(){


	union(){
		translate([-nema17_width/2, -nema17_width/2, 0])
			cube_fillet([nema17_width, nema17_width, nema17_height], vertical=[3,3,3,3]);
		translate([0,0,48]) {
			cylinder(d=22, h=2, $fn=60); //rasied center bit
			cylinder(d=5, h=22+2, $fn=60); //shaft
		}

		

	
	}
	


}


//pullet bottom = 1 or 0
module pulley(bottom = 1){
		//pulley GT2 20 tooth
		//pulley height = 16, diameter = 16, bottom=1mm, top=7+0.5;


		rotate([0,bottom*180,0])translate([0,0,-1-(16-7.5-1)/2]){
			color("orange")  cylinder(d=16, h=1, $fn=60);
			color("orange") translate([0,0,16-7.5]) cylinder(d=16, h=7.5, $fn=60);	
			color("yellow") translate([0,0,1]) cylinder(d=12.2, h=16-1-7.5, $fn=60);
		}
}





//calculate positions for bearings

inner_bearing_pos = [	nema17_width/2+20+GT2_pulley_geared_diameter/2+(GT2_belt_thickness-GT2_belt_tooth_height)+belt_bearing[2]/2, 
						y_bearing_block_width/2+xy_bearing_distance, //same as xy block
						0];

outer_bearing_pos = [	inner_bearing_pos[0]-belt_bearing[2]-GT2_belt_thickness-6, 
							inner_bearing_pos[1]-5, 
							0 ];


module y_motor_end_top(){

	difference(){
		y_motor_end_idler();
		translate([0,20,0])cube([y_block_width,y_block_length,y_block_height+min_beltbearing_height]);

	}

}

module y_motor_end_bottom(){
	intersection(){
		y_motor_end_idler();
		translate([0,20,0])cube([y_block_width,y_block_length,y_block_height+min_beltbearing_height-0.0001]);

	}
}



module y_motor_end_idler(){
	difference(){
		union(){
			translate([0,20,0]) 
				cube_fillet([60,25,y_block_height], vertical=[3,3,3,3]);
			translate([0,20,min_beltbearing_height+y_block_height]) 
				cube_fillet([60,25,y_block_height], vertical=[3,3,3,3]);
		
			translate([0, 20, 0]) 
				cube_fillet([20, y_block_length, min_beltbearing_height+y_block_height*2+frame_spacer_height], vertical=[3,3,3,3]);
			translate([60-20, 20, min_beltbearing_height+y_block_height*2]) 
				cube_fillet([20, 8, frame_spacer_height+20], vertical=[3,3,3,3]);

			

		}

		//frame screws
		frame_screws();
		bearing_holes();


	}
}

module motor_mount(){




nema_mount_thickness = 4;
//nema_mount_height = 30;


	difference(){
		union(){
			translate([20,20+50-7,min_beltbearing_height+y_block_height*2+frame_spacer_height-20-nema_mount_thickness]){
				cube([nema17_width, nema17_width+14,nema_mount_thickness]);
				translate([-20,0,0]) cube([20, nema17_width+14, 20+nema_mount_thickness]);
				//sides
				//cube([20, 6, 20+20+nema_mount_thickness]);
				support();
				translate([0,7+nema17_width+1,0])
					//cube([nema17_width, 6, 20+20+nema_mount_thickness]);
					support();

			}
			

		}

		translate([20,20+50-7,min_beltbearing_height+y_block_height*2+frame_spacer_height-20-nema_mount_thickness-0.1]){
				
			//frame screws (bottom)
			translate([-10,15,0])cylinder(d=frame_screw, h=20+nema_mount_thickness+0.2);				
			translate([-10,7+nema17_width+7-15,0])cylinder(d=frame_screw, h=20+nema_mount_thickness+0.2);	
				//frame screws (side)
			/*translate([-0.1,15/2,nema_mount_thickness+20+10]){
				rotate([0,90,0])cylinder(d=frame_screw, h=30);
				translate([21,0,0])rotate([0,90,0])cylinder(d=11, h=20+0.2); //countersink
			}
			translate([-0.1,15+nema17_width+15/2,nema_mount_thickness+20+10]){
				rotate([0,90,0])cylinder(d=frame_screw, h=30);
				translate([21,0,0])rotate([0,90,0])cylinder(d=11, h=20+0.2); //countersink
			}*/

			
			//curved ends
			//translate([nema17_width, -0.1, nema_mount_thickness+20+20]) rotate([-90,0,0])
				//cylinder(d=42, h=30+nema17_width+0.2, $fn=60);

			//middle cutout frame
			//translate([+0.1,15+nema17_width/2, nema_mount_thickness+20])
				//rotate([0,-90,0])cylinder(d=40, h=20+0.2, $fn=60);
		} // end translate
		

		translate([20+nema17_width/2,20+50+nema17_width/2,min_beltbearing_height+y_block_height*2+frame_spacer_height-20-nema_mount_thickness-0.1]){
			cylinder(d=28, h=4.2, $fn=60); //central nema hole

		//nema holes.

			translate([-nema17_holes/2, -nema17_holes/2, 0])
				cylinder(d=M3, h=nema_mount_thickness+0.2, $fn=60);
			translate([-nema17_holes/2, nema17_holes/2, 0])  
				cylinder(d=M3, h=nema_mount_thickness+0.2, $fn=60);
			translate([nema17_holes/2, nema17_holes/2, 0])
				cylinder(d=M3, h=nema_mount_thickness+0.2, $fn=60);
			translate([nema17_holes/2, -nema17_holes/2, 0])
				cylinder(d=M3, h=nema_mount_thickness+0.2, $fn=60);

		}




	}


}
	

module support(height=6, width=nema17_width){

	translate([0,height, 0])rotate([90,0,0])linear_extrude(height=height, slices = 20)
			polygon( points=[[0,0],
				[width,0],
              [20,40],
				[0,40], [0,0]] 
			);						


}
module bearing_holes(){
	//belt bearing holes

	//bearing inner
	translate(inner_bearing_pos)  cylinder(d=belt_bearing[0]+0.2, h=y_block_height*2+min_beltbearing_height, $fn=60);
	//bearing outer
	translate(outer_bearing_pos)  cylinder(d=belt_bearing[0]+0.2, h=y_block_height*2+min_beltbearing_height, $fn=60);
	//bearing outer padding space
	translate(outer_bearing_pos) translate([0,0,y_block_height]) cylinder(d=belt_bearing[1]*1.8, h=min_beltbearing_height, $fn=30);

	
	

}

module frame_screws(){
	// frame mount screw holes
		translate([10,20+t_nut_length/2,-0.1]) cylinder(d=frame_screw, h=min_beltbearing_height+y_block_height*2+frame_spacer_height+0.2);
		translate([10,20+t_nut_length+t_nut_length/2,-0.1]) cylinder(d=frame_screw, h=min_beltbearing_height+y_block_height*2+frame_spacer_height+0.2);

		translate([60-20/2, 20-0.1, min_beltbearing_height+y_block_height*2+frame_spacer_height+10]) {
			rotate([-90,0,0])cylinder(d=frame_screw, h=10);
			translate([0,4,0])rotate([-90,0,0])cylinder(d=11, h=min_beltbearing_height+y_block_height*2+frame_spacer_height+0.2);//countersink

		}
}


