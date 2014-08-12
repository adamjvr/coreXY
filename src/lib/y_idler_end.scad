// y-idler end
// Author: sdavi


include <../configuration.scad>
include <../dimensions.scad>



y_block_length = 60; //TODO: parametric?
y_block_width = 40; //TODO: parametric?
y_block_height = 4;



echo("block length:", y_block_length);
echo("block width:", y_block_width);
echo("block height:", y_block_height);


//translate([5,0,0]) y_idler_end_top();
//mirror([1,0,0])y_idler_end_top();

//translate([5,0,0])y_idler_end_bottom();
//mirror([1,0,0])y_idler_end_bottom();



idler_end_belt_bearing_distance = 18; 


rod_height = 34; //todo parametric
frame_width= 20; //20x20

//calculate positions for bearings and motor


inner_bearing_pos = [	13, 
							y_bearing_block_width/2+xy_bearing_distance, 
							0];

outer_bearing_pos = [	inner_bearing_pos[0]+idler_end_belt_bearing_distance, 
							inner_bearing_pos[1]-5, 
							0 ];



//
//y_rod_holder();
//y_idler_endi2();

//%color("grey")illustration();
//%color("orange")translate([-20,0,y_block_height*2+min_beltbearing_height+frame_spacer_height])mirror([0,0,1])y_rod_holder();



module y_rod_holder(){

	width = 15+10+15;
	height = y_block_height*2+min_beltbearing_height+frame_spacer_height;

	difference(){
		union(){
			translate([14,0,0])cube([12, frame_width, rod_height]);
			cube([width,frame_width, 20]);
			translate([14,frame_width/2,rod_height]) rotate([0,90,0]) 
				cylinder(d=frame_width, h=12, $fn=60);
			
			translate([25,0,20])corner(l=15, h=20);
			translate([15,0,20])mirror([1,0,0])corner(l=15, h=20);

		}
	
		//frame_screws
		translate([t_nut_length/2, frame_width/2, -0.1]){ 
			cylinder(d=frame_screw, h=height+0.2, $fn=60);
			translate([0,0,0.1+20])	cylinder(d=11, h=20, $fn=60);
		} 
		translate([width-t_nut_length/2, frame_width/2, -0.1]) {
			cylinder(d=frame_screw, h=height+0.2, $fn=60); 
			translate([0,0,0.1+20])	cylinder(d=11, h=20, $fn=60);

		}
		

		//y_rod
		translate([-0.1, frame_width/2, rod_height]) rotate([0,90,0])
			cylinder(d=y_bearing[0]+0.2, h=width+0.2, $fn=60);
	}

}

module illustration(){
//illustration
	%color("green")translate(inner_bearing_pos)translate([0,0,y_block_height])  
		cylinder(d=belt_bearing[1], h=belt_bearing[2], $fn=60);
	%color("green")translate(outer_bearing_pos)translate([0,0,y_block_height])  cylinder(d=belt_bearing[1], h=belt_bearing[2], $fn=60);		

//frames
	%color("grey")translate([y_block_width-20,0,-30]) cube([20,20,30+min_beltbearing_height+y_block_height*2+frame_spacer_height]);
	%translate([-30,0,min_beltbearing_height+y_block_height*2+frame_spacer_height]) cube([y_block_width+30, 20,20]);
	%translate([y_block_width-20,0,min_beltbearing_height+y_block_height*2+frame_spacer_height]) cube([20,y_block_length+30, 20]);



}

module y_idler_endi2(){

	difference(){
		union(){


			translate([5,20,0]) cube_fillet([y_block_width-5,y_block_length-20,y_block_height], vertical=[3,3,0,3]);//bottom plate


			translate([5,20,y_block_height+min_beltbearing_height])
				cube_fillet([y_block_width-5,y_block_length-20,y_block_height], vertical=[3,3,0,3]);//top plate


			hull(){
				//outer bearing support block, middle of vslot
				translate([y_block_width-10, y_block_length-19+(frame_screw+4)/2, 0])
					cylinder(d=frame_screw+4, h=min_beltbearing_height+y_block_height*2+frame_spacer_height, $fn=60);
				translate([y_block_width-10-5/2, y_block_length-1, 0])	
					cube([5,1,min_beltbearing_height+y_block_height*2+18]);
			}		

			//inner bearing corner
			translate([5,y_block_length-19, 0])
				cube_fillet([inner_bearing_pos[0]-belt_bearing[0]/2,19, min_beltbearing_height+y_block_height*2], vertical=[3,3,3,3]);


			//frame supports
			translate([y_block_width-20, y_block_length-20, min_beltbearing_height+y_block_height*2]){
				cube_fillet([20, 20, frame_spacer_height],vertical=[3,3,3,3]);
			//translate([0, 0, frame_spacer_height]) cube_fillet([4, 20,20], vertical=[0,3,3,0]);
			}
			
			translate([5, 20, min_beltbearing_height+y_block_height*2]) cube_fillet([y_block_width-5-20, 10, frame_spacer_height+20], vertical=[3,3,0,0]);

		}

		frame_screws();
		bearing_holes();
		
		//m3 screw for corner
		translate([(inner_bearing_pos[0]-belt_bearing[0]/2)/2+5,y_block_length-19/2, 0])
			cylinder(d=M3, h=min_beltbearing_height+y_block_height*2, $fn=60);

		//chop corner to match support

		
	}

}


module corner(l, h){

	difference(){
		cube([l,h,l]);
		translate([l,-0.1,l])rotate([-90,0,0])cylinder(d=l*2, h=h+0.2, $fn=60);
	}

}


module y_idler_end_top(){

	difference(){
		y_idler_endi2();
		cube([	y_block_width+0.2,
				y_block_length,
				y_block_height+min_beltbearing_height]);

	}

}

module y_idler_end_bottom(){
	intersection(){
		y_idler_endi2();
		cube([	y_block_width+0.2,
				y_block_length,
				y_block_height+min_beltbearing_height-0.001]);

	}
}






module frame_screws(d=frame_screw){
	translate([y_block_width-10, y_block_length-19+(frame_screw+4)/2, -0.1])
			cylinder(d=d, h=0.2+min_beltbearing_height+y_block_height*2+frame_spacer_height, $fn=60);

	translate([5+(y_block_width-5-20)/2, 20, min_beltbearing_height+y_block_height*2+frame_spacer_height+10]) rotate([-90,0,0]){

		translate([0,0,-0.1])cylinder(d=d, h=0.2+min_beltbearing_height+y_block_height*2+frame_spacer_height, $fn=60);
		translate([0,0,4])cylinder(d=10, h=0.2+min_beltbearing_height+y_block_height*2+frame_spacer_height, $fn=60);//countersink
	}

}

module bearing_holes(){
	//belt bearing holes

	//bearing inner
	translate(inner_bearing_pos){
	  	cylinder(d=belt_bearing[0], h=y_block_height*2+min_beltbearing_height, $fn=60);
		//bearing outer padding space
		translate([0,0,y_block_height]) 
			cylinder(d=belt_bearing[1]*1.8, h=min_beltbearing_height, $fn=30);
	}
	//bearing outer
	translate(outer_bearing_pos){
	  	cylinder(d=belt_bearing[0], h=y_block_height*2+min_beltbearing_height, $fn=60);
	}

}



