module diagonal_base(x) {
    color("SaddleBrown") intersection() {
        translate([0,25*x,0]) rotate([0,0,-45]) translate([0,-5.1,0]) cube([sqrt(pow(25*x,2)*2),10.2,5.2]);
        translate([0,0,0]) cube([25*x,25*x,10]);
    }
}

module diagonal_blank(x) {
    difference() {
        translate([-1,-1,-1]) cube([25*x+1,25*x+1,10]);
        translate([0,25*x,-2]) rotate([0,0,-45]) translate([0,+5.1,0]) cube([sqrt(pow(25*x,2)*2),100,12]);
    }
}

module diagonal_ckit_blank(x) {
    difference() {
        translate([-1,-1,-1]) cube([25*x+1,25*x+1,10]);
        translate([0,25*x,-2]) rotate([0,0,-45]) translate([-2,-5.5,0]) cube([sqrt(pow(25*x,2)*2)+4,100,12]);
    }
}
