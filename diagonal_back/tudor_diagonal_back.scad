thickness = 1.51*1.2;

module diagonal_stucco(x) {
    color("Cornsilk") intersection() {
        translate([0,1.5,0]) cube([sqrt((x*25)*(x*25)*2),7.2,38.8]);
        #translate([0,10.2/2,0]) rotate([0,0,-45]) translate([0,0,0]) cube([x*25,x*25,38.8]);
    }
}

module section_negative(x) {
    #translate([sqrt(100*100*2)/4*(x-1),0,0]) cube([sqrt(100*100*2)/4,10.2,38.8]);
}

module base_beam(x) {
    color("SaddleBrown") intersection() {
        cube([200, thickness, 3]);
        translate([0,10.2/2,0]) rotate([0,0,-45]) translate([0,0,0]) cube([x*25,x*25,38.8]);
    }
}

//Vertical Beams
/*x=2;
translate([sqrt(100*100*2)/4*(x-1)-1.5,0,3]) cube([3,thickness,38.8-6]);
*/

//Cross Beams
/*intersection() {
    //translate([-5.1-3,0,38.8/3+1]) cube([sqrt((100)*(100)*2),thickness,3]);
    translate([5.1+3,0,38.8/3+1]) cube([sqrt((100)*(100)*2),thickness,3]);
    section_negative(4);
}*/
//translate([5.1+3,0,38.8/3+1]) cube([sqrt((25)*(25)*2)-(5.1+3)*2,thickness,3]);

//Ends
/*intersection() {
    x=4;
    translate([sqrt((x*25)*(x*25)*2)-5.1-3,0,3]) cube([5.1+3,thickness,38.8-6]);
    translate([0,10.2/2,0]) rotate([0,0,-45]) translate([0,0,0]) cube([x*25,x*25,38.8]);
}*/
/*intersection() {
    translate([0,0,3]) cube([5.1+3,thickness,38.8-6]);
    translate([0,10.2/2,0]) rotate([0,0,-45]) translate([0,0,0]) cube([25,25,38.8]);
}*/

//Base
/*intersection() {
    base_beam(1);
    section_negative(1);
}*/
//diagonal_stucco(1);
//diagonal_stucco(2);
//diagonal_stucco(3);
//diagonal_stucco(4);
