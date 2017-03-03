/* [Base Tile Size] */
x = 2; //[1,2,3,4,5,6]
y = 2; //[1,2,3,4,5,6]

left = false; // [false,true]
right = false; // [false,true]

/* [Edge Tile Support] */
// Size of edge tile addition, 9.2 is standard for openforge
edge = 12.5;
left_edge = "false"; // [false,true]
right_edge = "false"; // [false,true]
front_edge = "false"; // [false,true]
back_edge = "false"; // [false,true]

/* [Magnets] */
// Size of hole for magnet.  5.5 works well for 5mm buckyball style magnets.  0 to eliminate.
magnet_hole = 5.5;

/* [Joinery Holes] */
// Size of hole for Filament tile joining.
filament_wire_hole = 0.975; // 0:Off,0.975:1.75mm filament,1.6:3mm filament
// Size of hole for paperclip tile joining.
paperclip_wire_hole = 0; // 0:Off,0.65:20 Gauge,0.7:18 Gauge

/* [Construction Kit] */
ckit_squares = "false"; //[false,true]

/* [Metric or Imperial] */
system = "metric"; //[metric,imperial]

module wire_holes(x,y,filament_wire_hole=0.975,paperclip_wire_hole=0,edge=12.5) {
    // center: 1  mm wire  18 gauge 
    // crossed: .8  mm wire  20 gauge 7.4 small  9.3 large  20 gauge
    eoffset = -1 - edge;

    xlength = 2 + 2 * edge + 25 * x - edge;
    ylength = 2 + 2 * edge + 25 * y - edge;
    if (x > 1) {
        for ( i = [2 : x] ) {
            ipos = i * 25 - 25;
            if (filament_wire_hole > 0) {
                translate([ipos-3,eoffset,6/2]) rotate([-90,0,0]) cylinder(ylength,filament_wire_hole,filament_wire_hole,$fn=50);
                translate([ipos+3,eoffset,6/2]) rotate([-90,0,0]) cylinder(ylength,filament_wire_hole,filament_wire_hole,$fn=50);
            }
            if (paperclip_wire_hole > 0.0) {
                // Large Loop
                translate([ipos+4.5,eoffset,6/2+1.5]) rotate([-90,0,0]) cylinder(ylength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                translate([ipos-4.5,eoffset,6/2+1.5]) rotate([-90,0,0]) cylinder(ylength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                translate([ipos+4.5,eoffset,6/2-1]) rotate([-90,0,0]) cylinder(ylength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                translate([ipos-4.5,eoffset,6/2-1]) rotate([-90,0,0]) cylinder(ylength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                // Small Loop
                translate([ipos+2.4,eoffset,6/2+1.5]) rotate([-90,0,0]) cylinder(ylength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                translate([ipos-2.4,eoffset,6/2+1.5]) rotate([-90,0,0]) cylinder(ylength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
            }
        }
    }
    
    if (y > 1) {
        for ( i = [2 : y] ) {
            ipos = i*25-25;
            if (filament_wire_hole > 0) {
                translate([eoffset,ipos-3,6/2]) rotate([0,90,0]) cylinder(xlength,filament_wire_hole,filament_wire_hole,$fn=50);
                translate([eoffset,ipos+3,6/2]) rotate([0,90,0]) cylinder(xlength,filament_wire_hole,filament_wire_hole,$fn=50);
            }
            if (paperclip_wire_hole > 0.0) {
                // Large Loop
                translate([eoffset,ipos+4.5,6/2+1.5]) rotate([0,90,0]) cylinder(xlength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                translate([eoffset,ipos-4.5,6/2+1.5]) rotate([0,90,0]) cylinder(xlength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                translate([eoffset,ipos+4.5,6/2-1]) rotate([0,90,0]) cylinder(xlength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                translate([eoffset,ipos-4.5,6/2-1]) rotate([0,90,0]) cylinder(xlength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                // Small Loop
                translate([eoffset,ipos+2.4,6/2+1.5]) rotate([0,90,0]) cylinder(xlength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
                translate([eoffset,ipos-2.4,6/2+1.5]) rotate([0,90,0]) cylinder(xlength,paperclip_wire_hole,paperclip_wire_hole,$fn=50);
            }
        }
    }
}

module magnet_ejection_holes(x,y,magnet_hole,
        left_edge="false",right_edge="false",front_edge="false",back_edge="false",edge=12.5,left=false,right=false) {
    if (magnet_hole > 0) {
        l = left_edge == "true"?edge:0;
        r = right_edge == "true"?edge:0;
        f = front_edge == "true"?edge:0;
        b = back_edge == "true"?edge:0;
        for ( i = [1 : x] ) {
            translate([i*25-12.5,3.6-f,-1]) cylinder(10,.9,.9,$fn=50);
            if((i != 1 || !left) && (i != x || !right)) {
                translate([i*25-12.5,y*25-3.6+b,-1]) cylinder(10,.9,.9,$fn=50);
            }
        }
        for ( i = [1 : y] ) {
            translate([3.6-l,i*25-12.5,-1]) cylinder(10,.9,.9,$fn=50);
            translate([x*25-3.6+r,i*25-12.5,-1]) cylinder(10,.9,.9,$fn=50);
        }
    }
}

module fs_magnet_holder(magnet_hole=5.5) {
    // 5mm buckyballs
    if(magnet_hole > 0) {
        difference() {
            cylinder(6,3.7,3.7, $fn=100);
            translate([0,0,-1]) cylinder(8,magnet_hole/2,magnet_hole/2, $fn=100);
        }
    }
}

module fs_magnet_base(x,y,
        left_edge="false",right_edge="false",front_edge="false",back_edge="false",edge=12.5,
        magnet_hole=5.5,filament_wire_hole=0.975,paperclip_wire_hole=0,ckit_squares="false", left=false,right=false) {
    l = left_edge == "true"?edge:0;
    r = right_edge == "true"?edge:0;
    f = front_edge == "true"?edge:0;
    b = back_edge == "true"?edge:0;
            
    li = left_edge == "true"?edge-1:0;
    ri = right_edge == "true"?edge-1:0;
    fi = front_edge == "true"?edge-1:0;
    bi = back_edge == "true"?edge-1:0;

    li2 = left_edge == "true"?edge-2:0;
    ri2 = right_edge == "true"?edge-2:0;
    fi2 = front_edge == "true"?edge-2:0;
    bi2 = back_edge == "true"?edge-2:0;
    ckit = ckit_squares == "true"?true:false;

    left_diff = left ? edge-2 : 0;
    right_diff = right ? edge-2 : 0;

    difference() {
        union() {
            translate([-l,-f,0]) difference() {
                cube([25*x+l+r,25*y+f+b,6]);
                difference() {
                    translate([1,1,-1]) cube([25*x-2+li2+ri2,25*y-2+fi2+bi2,8]);
                    if (left) {
                        translate([-1,y*25-1,-1]) cube([edge+2, edge+2, 8]);
                    }
                    if (right) {
                        translate([x*25-edge-1,y*25-1,-1]) cube([edge+2, edge+2, 8]);
                    }
                }
                if (left) {
                    translate([-1,y*25,-1]) cube([edge+1, edge+1, 8]);
                }
                if (right) {
                    translate([x*25-edge,y*25,-1]) cube([edge+1, edge+1, 8]);
                }
            }
            translate([6.4-l,6.4-f,0]) difference() {
                cube([25*x-12.8+li2+ri2,25*y-12.8+fi2+bi2,6]);
                difference() {
                    translate([1,1,-1]) cube([25*x-14.8+li2+ri2,25*y-14.8+fi2+bi2,8]);
                    if (left) {
                        translate([-1,y*25-12.8-1,-1]) cube([edge+2, edge+1, 8]);
                    }
                    if (right) {
                        translate([x*25-edge-12.8-1,y*25-12.8-1,-1]) cube([edge+1, edge+1, 8]);
                    }
                }
                if (left) {
                    translate([-1,y*25-12.8,-1]) cube([edge+1, edge+1, 8]);
                }
                if (right) {
                    translate([x*25-edge-12.8,y*25-12.8,-1]) cube([edge+1, edge+1, 8]);
                }
            }
            translate([-l,-f,0]) difference() {
                cube([25*x+l+r,25*y+f+b,0.5]);
                difference() {
                    translate([7,7,-1]) cube([25*x-14+li2+ri2,25*y-14+fi2+bi2,8]);
                    if (left) {
                        translate([-1+6.4,y*25-6.4-1,-1]) cube([edge+2, edge+1, 8]);
                    }
                    if (right) {
                        translate([x*25-edge-6.4-1,y*25-6.4-1,-1]) cube([edge+1, edge+1, 8]);
                    }
                }
                if (left) {
                    translate([-1,y*25,-1]) cube([edge+1, edge+1, 8]);
                }
                if (right) {
                    translate([x*25-edge,y*25,-1]) cube([edge+1, edge+1, 8]);
                }
            }
            for ( i = [1 : x] ) {
                translate([i*25-12.5,3.7-fi2,0]) fs_magnet_holder(magnet_hole);
                if((i != 1 || !left) && (i != x || !right)) {
                    translate([i*25-12.5,y*25-3.7+bi2,0]) fs_magnet_holder(magnet_hole);
                }
            }
            for ( i = [1 : y] ) {
                translate([3.7-li2,i*25-12.5,0]) fs_magnet_holder(magnet_hole);
                translate([x*25-3.7+ri2,i*25-12.5,0]) fs_magnet_holder(magnet_hole);
            }
            if (x > 1) {
                for ( i = [2 : x] ) {
                    translate([i*25-25-6,-fi2,0]) cube([12,7,6]); 
                    translate([i*25-25-6,y*25-7+bi2,0]) cube([12,7,6]); 
                }
            }
            if (y > 1) {
                for ( i = [2 : y] ) {
                    translate([-li2,i*25-25-6,0]) cube([7,12,6]); 
                    translate([x*25-7+ri2,i*25-25-6,0]) cube([7,12,6]); 
                }
            }
            translate([-li2,-fi2,0]) cube([7,7,6]);
            translate([x*25-7+ri2,-fi2,0]) cube([7,7,6]);
            translate([-li2,y*25-7+bi2-left_diff,0]) cube([7,7,6]);
            translate([x*25-7+ri2,y*25-7+bi2-right_diff,0])translate([]) cube([7,7,6]);
            if (left) {
                translate([-li2+edge,y*25-7+bi2-left_diff,0]) cube([7,edge+6.4,6]);
            }
            if (right) {
                translate([x*25-7+ri2-edge,y*25-7+bi2-right_diff,0]) cube([7,edge+6.4,6]);
            }
            if(ckit) {
                translate([-li2+1+6,-fi2+1+6,0]) cube([6,6,6]);
                translate([x*25-7+ri2-6,-fi2+1+6,0]) cube([6,6,6]);
                translate([-li2+1+6,y*25-7+bi2-6,0]) cube([6,6,6]);
                translate([x*25-7+ri2-6,y*25-7+bi2-6,0]) cube([6,6,6]);
            }
        }
        wire_holes(
            x, y,
            filament_wire_hole=filament_wire_hole,
            paperclip_wire_hole=paperclip_wire_hole);
        magnet_ejection_holes(
            x,y,
            magnet_hole,
            left_edge=left_edge,
            right_edge=right_edge,
            front_edge=front_edge,
            back_edge=back_edge,
            edge=edge-2,
            left=left,
            right=right);
        for ( i = [1 : x] ) {
            if(front_edge == "true") {
                translate([i*25-12.5,3.7-f,magnet_hole/2+.2]) sphere(magnet_hole/2-.3,$fn=100);
            }
            if(back_edge == "true") {
                if((i != 1 || !left) && (i != x || !right)) {
                    translate([i*25-12.5,y*25-3.7+b,magnet_hole/2+.2]) sphere(magnet_hole/2-.3,$fn=100);
                }
            }
        }
        for ( i = [1 : y] ) {
            if(left_edge == "true") {
                translate([3.7-l,i*25-12.5,magnet_hole/2+.2]) sphere(magnet_hole/2-.3,$fn=100);
            }
            if(right_edge == "true") {
                translate([x*25-3.7+r,i*25-12.5,magnet_hole/2+.2]) sphere(magnet_hole/2-.3,$fn=100);
            }
        }
    }
}

conversion = system == "metric" ? 1.0 : 25.4/25;

color("Sienna") scale([conversion, conversion, conversion]) fs_magnet_base(x,y,left_edge,right_edge,front_edge,back_edge,edge,magnet_hole,filament_wire_hole=filament_wire_hole,paperclip_wire_hole=paperclip_wire_hole,ckit_squares=ckit_squares,left=left,right=right);
