// Robert Valentine
$fn = $preview ? 25 : 100;

bracket_hub_length = 12.5;
bracket_length = 44 - bracket_hub_length;
//bracket_length = 64.5 - bracket_hub_length;
bracket_width = 55.80;
bracket_height = 25;
bracket_thickness = 2.15;
bracket_walls = bracket_thickness * 2;
bracket_size = [bracket_length, bracket_width, bracket_height];
bracket_inner_size = [bracket_length*2, bracket_width-bracket_walls, bracket_height+2];

bearing_hole = 8.15;
mounting_hole = 3;
mounting_hole_seperation = 7.25;
mounting_hole_distance = 5.5;

difference(){
    union(){
        // Cutout Inner Bracket from Bracket
        difference(){
            // Create Bracket
            cube(bracket_size);
            // Move Origin to Inner Bracket Location
            translate([bracket_thickness, bracket_thickness, -1])
            // Create Inner Bracket and Cutout
            cube(bracket_inner_size);
        }
        // Cutout Inner Bracket from Cylinder Ends
        difference(){
            // Move and Rotate Origin for Cylinder Ends
            translate([bracket_length, bracket_width/2, bracket_hub_length])
            rotate([90, 0, 0])
            // Create Cylinder Ends
            cylinder(h=bracket_width, r=bracket_hub_length, center=true);
            // Move Origin to Inner Bracket Location
            translate([bracket_thickness, bracket_thickness, -1])
            // Create Inner Bracket Cylinder Ends and Cutout
            cube(bracket_inner_size);
        }
    }

    union(){
        // Bracket Bottom Bearing Mounting Hole
        translate(
            [bracket_length/2,
            bracket_width/2,
            mounting_hole_distance]
        )
        rotate([0, 90, 0])
        cylinder(h=bracket_width+2, d=mounting_hole, center=true);

        // Bracket Top Bearing Mounting Hole
        translate(
            [bracket_length/2,
            bracket_width/2,
            bracket_height-mounting_hole_distance]
        )
        rotate([0, 90, 0])
        cylinder(h=bracket_width+2, d=mounting_hole, center=true);

        // Bracket Left Bearing Mounting Hole
        translate(
            [bracket_length/2,
            bracket_width/2 - mounting_hole_seperation,
            bracket_hub_length]
        )
        rotate([0, 90, 0])
        cylinder(h=bracket_width+2, d=mounting_hole, center=true);

        // Bracket Right Bearing Mounting Hole
        translate(
            [bracket_length/2,
            bracket_width/2 + mounting_hole_seperation,
            bracket_hub_length]
        )
        rotate([0, 90, 0])
        cylinder(h=bracket_width+2, d=mounting_hole, center=true);

        // Bracket Bearing Hole
        translate(
            [bracket_length/2,
            bracket_width/2,
            bracket_hub_length]
        )
        rotate([0, 90, 0])
        cylinder(h=bracket_width+2, d=bearing_hole, center=true);


        // Cylinder Ends Bearing Hole
        translate([bracket_length, bracket_width/2, bracket_hub_length])
        rotate([90, 0, 0])
        cylinder(h=bracket_width+2, d=bearing_hole, center=true);
        
        // Cylinder Ends Bearing Hole Left Bearing Mounting Hole
        translate(
            [bracket_length - mounting_hole_seperation,
            bracket_width/2,
            bracket_hub_length]
        )
        rotate([90, 0, 0])
        cylinder(h=bracket_width+2, d=mounting_hole, center=true);
        
        // Cylinder Ends Bearing Hole Right Bearing Mounting Hole
        translate(
            [bracket_length + mounting_hole_seperation,
            bracket_width/2,
            bracket_hub_length]
        )
        rotate([90, 0, 0])
        cylinder(h=bracket_width+2, d=mounting_hole, center=true);
        
        // Cylinder Ends Bearing Hole Top Bearing Mounting Hole
        translate(
            [bracket_length,
            bracket_width/2,
            bracket_hub_length + mounting_hole_seperation]
        )
        rotate([90, 0, 0])
        cylinder(h=bracket_width+2, d=mounting_hole, center=true);
        
        // Cylinder Ends Bearing Hole Bottom Bearing Mounting Hole
        translate(
            [bracket_length,
            bracket_width/2,
            bracket_hub_length - mounting_hole_seperation]
        )
        rotate([90, 0, 0])
        cylinder(h=bracket_width+2, d=mounting_hole, center=true);

    }
}
