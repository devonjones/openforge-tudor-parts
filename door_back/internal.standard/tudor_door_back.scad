
module door_hole(x) {
    translate([x*25/2-29/2,-1,-1]) cube([29,9.7-1.5,40]);
    translate([x*25/2-31/2,5,-1]) cube([31,12.2,40]);
    translate([x*25/2-33/2,-1,38.8-3.1]) cube([33,12.2,3.2]);
}

module stucco_hole() {
    translate([x*25/2-29/2,-1,-1]) cube([29,12.2,40]);
    translate([x*25/2-33/2,-1,38.8-3.1]) cube([33,12.2,3.2]);
}

module stucco(x) {
    color("Cornsilk") difference() {
        translate([0,1.5,0]) cube([25*x,7.2,38.8]);
        stucco_hole();
    }
}

module wall_frame(x,slash=false,reverse_slash=false,cross_beam=false) {
    thickness = 1.51;
    color("SaddleBrown") {
        cube([25*x,thickness,3]);
        translate([0,0,38.8-3]) cube([25*x,thickness,3]);
        translate([0,0,3]) cube([1.5,thickness,38.8-6]);
        translate([25*x-1.5,0,3]) cube([1.5,thickness,38.8-6]);
        for (i = [1:(x-1)]) {
            translate([25*i-1.5,0,3]) cube([3,thickness,38.8-6]);
        }
        for (i = [1:x]) {
            if (slash) {
                if(i%2 == 0) {
                     translate([25*(i-1),0,3]) rotate([0,-57,0]) mirror([0,0,1]) cube([41,thickness,3]);
                } else {
                     translate([25*(i-1),0,38.8-3]) rotate([0,57,0]) cube([41,thickness,3]);
                }
            }
            if (reverse_slash) {
                if(i%2 == 0) {
                     translate([25*(i-1),0,38.8-3]) rotate([0,57,0]) cube([41,thickness,3]);
                     // Double
                     //translate([25*(i-1),0,38.8-3]) rotate([0,36,0]) cube([59,thickness,3]);
                } else {
                     translate([25*(i-1),0,3]) rotate([0,-57,0]) mirror([0,0,1]) cube([41,thickness,3]);
                     // Double
                     // translate([25*(i-1),0,3]) rotate([0,-36,0]) mirror([0,0,1]) cube([59,thickness,3]);
                }
            }
            if (cross_beam) {
                translate([25*(i-1)+1.5,0,38.8/3+1]) cube([25-3,thickness,3]);
            }
        }
    }
}

module door_frame(x) {
    color("SaddleBrown") {
        translate([7.5,0,3]) cube([3,1.5,32.7]);
        translate([50-10.5,0,3]) cube([3,1.5,32.7]);
        translate([9.5,10.2-3,0]) cube([3,3,35.7]);
        translate([50-12.5,10.2-3,0]) cube([3,3,35.7]);
    }
}

door_frame(;
module door_top_1() {
    color("SaddleBrown") {
        difference() {
            union() {
                translate([x*25/2-32.8/2,0,38.8-3]) cube([32.8,10.2,3]);
                translate([x*25/2-24.8/2,10.2-3,38.8-7]) cube([24.8,2,5]);
            }
            hull() {
                translate([25,0,38.8-3]) rotate([0,45+90,0]) cube([1,10.2,1]);
                translate([13.5,0,38.8-7]) rotate([-90,0,0]) cylinder(10,1,1,$fn=50);
                translate([50-13.5,0,38.8-7]) rotate([-90,0,0]) cylinder(10,1,1,$fn=50);
            }
            translate([10.5+3.5,3.7,1]) cylinder(50,1,1,$fn=25);
        }
    }
}

module door_top_2() {
    color("SaddleBrown") {
        difference() {
            union() {
                translate([x*25/2-32.8/2,0,38.8-3]) cube([32.8,10.2,3]);
                translate([x*25/2-24.8/2,10.2-3,38.8-7]) cube([24.8,2,4]);
            }
            translate([25,0,38.8-7]) rotate([-90,0,0]) scale([1,.3,1]) cylinder(10,12.5,12.5,$fn=50);
            translate([10.5+3.5,3.7,1]) cylinder(50,1,1,$fn=25);
        }
    }
}

module door_top_3() {
    color("SaddleBrown") {
        difference() {
            union() {
                translate([x*25/2-32.8/2,0,38.8-3]) cube([32.8,10.2,3]);
                translate([x*25/2-24.8/2,10.2-3,38.8-6]) cube([24.8,2,3]);
            }
            translate([10.5+3.5,3.7,1]) cylinder(50,1,1,$fn=25);
        }
    }
}

            //translate([10.5,3.7,1]) cylinder(50,1,1,$fn=25);
//stucco(2);
/*
stucco(2);
difference() {
    union() {
        wall_frame(2,slash=false,reverse_slash=false,cross_beam=false);
        translate([0,10.2-1.5,0]) wall_frame(2, slash=false);
    }
    door_hole(x);
}
door_frame(x);
door_top_3();

door_hole(2);
stucco_hole(2);
*/

thickness = 1.51;
x=2;

//            translate([50-10.5-3.5,3.7,1]) cylinder(50,1,1,$fn=25);

/*
difference() {
                      translate([0,0,3]) rotate([0,-36,0]) mirror([0,0,1]) cube([59,thickness,3]);

        translate([0,-.1,0]) cube([25*x,thickness+.2,3]);
        translate([0,-.1,38.8-3]) cube([25*x,thickness+.2,3]);
        translate([0,-.1,3-.1]) cube([1.5,thickness+.2,38.8-6+.2]);
        translate([25*x-1.5,-.1,3-.1]) cube([1.5,thickness+.2,38.8-6+.2]);
    if (x > 1) {
        for (i = [1:(x-1)]) {
            translate([25*i-1.5,-.1,3-.1]) cube([3,thickness+.2,38.8-6]);
        }
    }
}
*/

/* Base
difference() {
    translate([0.1,0.1,0]) cube([49.8,10,5.2]);
    translate([x*25/2-29/2,-1,-1]) cube([29,8.2,40]);
    translate([x*25/2-25/2,-1,-1]) cube([25,12.2,40]);
}
*/

module door() {
    difference() {
        intersection() {
            union() {
                color("SaddleBrown") difference() {
                    translate([-25,0,-2]) cube([50,50,4]);
                    union() {
                        hull() {
                            translate([0,2,-3]) rotate([0,0,45]) cube([1,1,6]);
                            translate([-11.5+2.5,4.2+2,-5]) cylinder(10,1,1,$fn=50);
                            translate([11.5-2.5,4.2+2,-5]) cylinder(10,1,1,$fn=50);
                        }
                        translate([-10,6,-3]) cube([20,27,6]);
                    }
                }
                color("SaddleBrown") translate([-5,0,-1.70])  cube([2,50,3.4]);
                color("SaddleBrown") translate([5-2,0,-1.70]) cube([2,50,3.4]);
        
                color("SaddleBrown") translate([-25,27,-1.70]) cube([50,2,3.4]);
                color("SaddleBrown") translate([-25,18,-1.70]) cube([50,2,3.4]);
                color("SaddleBrown") translate([-25,9,-1.70]) cube([50,2,3.4]);
                color("Peru") translate([-25,0,-1.1]) cube([50,50,2.2]);
            }
            color("SaddleBrown") union() {
                translate([-28/2,0,-3]) cube([28,35,6]);
            }
        }
        color("SaddleBrown") translate([-11,40,0]) rotate([90,0,0]) cylinder(50,.75,.75, $fn=100);
    }
}

