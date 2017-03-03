
module stucco(x) {
    color("Cornsilk") translate([0,1.5+25*x,0]) cube([25*x+1.5+12.5-3,12.5-3,38.8]);
    color("Cornsilk") translate([1.5+25*x,0,0]) cube([12.5-3,25*x+1.5,38.8]);
}

module corner_frame(x,slash=false,reverse_slash=false,cross_beam=false) {
    thickness = 1.51;
    color("SaddleBrown") {
        translate([0,25*x-10.2,0]) cube([25*x-10.2,thickness,3]);
        translate([0,25*x-10.2,38.8-3]) cube([25*x-10.2,thickness,3]);
        translate([0,25*x-10.2,3]) cube([1.5,thickness,38.8-6]);
        translate([25*x-10.2,25*x-10.2,0]) cube([1.5,thickness,38.8]);

        translate([0,25*x-1.5,0]) cube([25*x-3,thickness,3]);
        translate([0,25*x-1.5,38.8-3]) cube([25*x-3,thickness,3]);
        translate([0,25*x-1.5,3]) cube([1.5,thickness,38.8-6]);
        translate([25*x-3,25*x-1.5,0]) cube([3,thickness,38.8]);

        translate([25*x-10.2,0,0]) cube([thickness,25*x-10.2,3]);
        translate([25*x-10.2,0,38.8-3]) cube([thickness,25*x-10.2,3]);
        translate([25*x-10.2,0,3]) cube([thickness,1.5,38.8-6]);
        translate([25*x-10.2,25*x-10.2,0]) cube([thickness,1.5,38.8]);

        translate([25*x-1.5,0,0]) cube([thickness,25*x-3,3]);
        translate([25*x-1.5,0,38.8-3]) cube([thickness,25*x-3,3]);
        translate([25*x-1.5,0,3]) cube([thickness,1.5,38.8-6]);
        translate([25*x-1.5,25*x-3,0]) cube([thickness,1.5,38.8]);

        for (i = [1:(x-1)]) {
            translate([25*i-1.5,25*x-10.2,3]) cube([3,thickness,38.8-6]);
            translate([25*i-1.5,25*x-1.5,3]) cube([3,thickness,38.8-6]);
            translate([25*x-10.2,25*i-1.5,3]) cube([thickness,3,38.8-6]);
            translate([25*x-1.5,25*i-1.5,3]) cube([thickness,3,38.8-6]);
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

stucco(4);
/*
corner_frame(2,slash=false,reverse_slash=false,cross_beam=false);
translate([0,10.2-1.5,0]) wall_frame(2, slash=true);
*/
/*
thickness = 1.51;
x=2;



difference() {
        translate([0,0,3]) rotate([0,-37,0]) mirror([0,0,1]) cube([58,thickness,3]);

        translate([0,-.1,0]) cube([25*x,thickness+.2,3]);
        translate([0,-.1,38.8-3]) cube([25*x,thickness+.2,3]);
        translate([0,-.1,3-.1]) cube([1.5,thickness+.2,38.8-6+.2]);
        translate([25*x-3,-.1,3-.1]) cube([1.5,thickness+.2,38.8-6+.2]);
    if (x > 1) {
        for (i = [1:(x-1)]) {
            translate([25*i-1.5,-.1,3-.1]) cube([3,thickness+.2,38.8-6]);
        }
    }
}
*/