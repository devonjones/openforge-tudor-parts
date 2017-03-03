thickness = 1.51*1.2;

module diagonal_stucco(x) {
    extra = sqrt((12.5/2)*(12.5/2)*2);
    color("Cornsilk") intersection() {
        translate([0,1.5,0]) cube([sqrt(((x*25)+12.5)*((x*25)+12.5)*2),9.5,44]);
        translate([0,,0]) rotate([0,0,-45]) translate([0,0,0]) cube([x*25,x*25,44]);
    }
}
//diagonal_stucco(2);


module section_negative(x,beam=false,right=false,left=false) {
    beamval = beam ? 1.5 : 0;
    rightval = right ? 1.5 : 0;
    leftval = left ? 1.5 : 0;
    translate([sqrt(100*100*2)/4*(x-1)+beamval+leftval,0,0]) cube([sqrt(100*100*2)/4-beamval*2-leftval-rightval,12.5,38.8]);
}

module base_beam(x,back=false) {
    color("SaddleBrown") intersection() {
        translate([0,back?12.5-thickness:0,5.2]) cube([200, thickness, 3]);
        translate([0,0,0]) rotate([0,0,-45]) translate([0,0,0]) cube([x*25,x*25,38.8]);
    }
}

//Vertical Beams
x=4;
//translate([sqrt(100*100*2)/4*(x-1)-1.5,0,3+5.2]) cube([3,thickness,38.8-6]);
//translate([sqrt(100*100*2)/4*(3-1)-1.5,0,3+5.2]) cube([3,thickness,38.8-6]);
//translate([sqrt(100*100*2)/4*(4-1)-1.5,0,3+5.2]) cube([3,thickness,38.8-6]);
//translate([sqrt(100*100*2)/4*(x-1)-1.5,12.5-thickness,0]) cube([3,thickness,44-3]);
//translate([sqrt(100*100*2)/4*(3-1)-1.5,12.5-thickness,0]) cube([3,thickness,44-3]);
//translate([sqrt(100*100*2)/4*(4-1)-1.5,12.5-thickness,0]) cube([3,thickness,44-3]);


//Cross Beams
/*intersection() {
    //translate([-5.1-3,0,38.8/3+1]) cube([sqrt((100)*(100)*2),thickness,3]);
    translate([3,12.5-thickness,38.8/3+1+5.2]) cube([sqrt((100)*(100)*2),thickness,3]);
    section_negative(4,beam=true);
}*/
//translate([5.1+3,0,38.8/3+1]) cube([sqrt((25)*(25)*2)-(5.1+3)*2,thickness,3]);



//Ends
/*intersection() {
    x=2;
    translate([sqrt((x*25)*(x*25)*2)-3,0,3+5.2]) cube([3,thickness,38.8-6]);
    translate([0,0,0]) rotate([0,0,-45]) translate([0,0,0]) cube([x*25,x*25,44]);
}*/
/*intersection() {
    translate([0,0,3+5.2]) cube([3,thickness,38.8-6]);
    translate([0,0,0]) rotate([0,0,-45]) translate([0,0,0]) cube([25,25,44]);
}*/
/*intersection() {
    x=4;
    translate([sqrt((x*25)*(x*25)*2)-12.5-1.5,12.5-thickness,0]) cube([3,thickness,44-3]);
    translate([0,0,0]) rotate([0,0,-45]) translate([0,0,0]) cube([x*25,x*25,44]);
}*/
/*intersection() {
    translate([12.5-1.5,12.5-thickness,]) cube([3,thickness,44-3]);
    translate([0,0,0]) rotate([0,0,-45]) translate([0,0,0]) cube([25,25,44]);
}*/


//Base
/*translate([0,0,44-5.2-3]) intersection() {
    base_beam(4,true);
    section_negative(3);
}*/

/*
//Top
intersection() {
    base_beam(2);
    section_negative(1);
}
*/

//diagonal_stucco(1);
//diagonal_stucco(2);
//diagonal_stucco(3);
//diagonal_stucco(4);


color("Cornsilk") intersection() {
    translate([0,0,0]) cube([sqrt(((x*25)+12.5)*((x*25)+12.5)*2),1.51,5.2]);
    translate([0,,0]) rotate([0,0,-45]) translate([0,0,0]) cube([x*25,x*25,44]);
}
