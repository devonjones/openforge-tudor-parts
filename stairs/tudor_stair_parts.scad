length = 5.8;
width = length / 1.6;
gap = (24-(length*3+width))/3;
vgap = 0.75;

module layer(x, y, h=4, odd=true, level=0) {
    reduce = h==2 ? 1.025 : 0;
    height = width - reduce;
    color("LightGrey") translate([1.5,1.5,0]) cube([x-2,y-2,width+vgap-reduce]);
    
    if (odd) {
        xblocks = floor(x / (length + gap));
        yblocks = floor((y-width-gap) / (length + gap));
        for (i = [0:xblocks]) {
            side_x(x, i, height, sides_x2[level][i]);
            translate([1+x,1+y,0]) rotate([0,0,180]) side_x(x, i, height, sides_x1[level][i]);
        }
        for (i = [1:yblocks]) {
            side_y(x, y, i, height, sides_y2[level][i]);
            translate([1+x,1+y,0]) rotate([0,0,180]) side_y(x, y, i, height, sides_y1[level][i]);
        }
    } else {
        translate([0,0,0]) {
            xblocks = floor(x / (length + gap));
            yblocks = floor((y-width-gap) / (length + gap));
            for (i = [0:xblocks]) {
                side_x2(x, i, height, sides_x2[level][i]);
                translate([1+x,1+y,0]) rotate([0,0,180]) side_x2(x, i, height, sides_x1[level][i]);
            }
            for (i = [1:yblocks]) {
                translate([-x+width,0,0]) side_y(x, y, i, height, sides_y2[level][i]);
                translate([1+x*2-width,1+y,0]) rotate([0,0,180]) side_y(x, y, i, height, sides_y1[level][i]);
            }
        }
    }
}

module stair_riser(y) {
    for(level = [0:3]) {
        h = y*25-1;
        level_len = 43 - level * 6;
        reduce = h==2 ? 1.025 : 0;
        height = width - reduce;
        color("Cornsilk") translate([2,2,(width+vgap)*level]) cube([level_len-2.5,h-3,width+vgap-reduce]);   
        color("Cornsilk") translate([0.5+level_len-2,0.5+1+.5,(width+vgap)*level]) cube([8-1,h-3,1]);
    }
}

module stair_riser_stairs(y) {
    for(level = [0:3]) {
        level_len = 43 - level * 6;
        for(i = [1:y]) {
            intersection() {
                color("SaddleBrown") translate([0.5+level_len+0.2,0.5+(i-1)*25,(width+vgap)*level]) cube([5.8,24,2]);
            }
        }
    }
    color("SaddleBrown") translate([0.5,0.5,(width+vgap)*4]) cube([25,5.25,2]);
    color("SaddleBrown") translate([0.5,0.5+6.25,(width+vgap)*4]) cube([25,5.25,2]);
    color("SaddleBrown") translate([0.5,0.5+6.25*2,(width+vgap)*4]) cube([25,5.25,2]);
    color("SaddleBrown") translate([0.5,0.5+6.25*3,(width+vgap)*4]) cube([25,5.25,2]);
    if(y > 1) {
        color("SaddleBrown") translate([0.5,0.5+6.25*4,(width+vgap)*4]) cube([25,5.25,2]);
        color("SaddleBrown") translate([0.5,0.5+6.25*5,(width+vgap)*4]) cube([25,5.25,2]);
        color("SaddleBrown") translate([0.5,0.5+6.25*6,(width+vgap)*4]) cube([25,5.25,2]);       color("SaddleBrown") translate([0.5,0.5+6.25*7,(width+vgap)*4]) cube([25,5.25,2]);
    }
}

module stair_riser_beams(y) {
    color("SaddleBrown") translate([0.5,0.5,0]) cube([3,3,(width+vgap)*4]);
    color("SaddleBrown") translate([0.5+22,0.5,0]) cube([3,3,(width+vgap)*4]);
    if(y == 1) {
        color("SaddleBrown") translate([0.5,0.5+21,0]) cube([3,3,(width+vgap)*4]);
        color("SaddleBrown") translate([0.5+22,0.5+21,0]) cube([3,3,(width+vgap)*4]);
    } else if (y == 2) {
        color("SaddleBrown") translate([0.5,0.5+21.5+1.5,0]) cube([3,3,(width+vgap)*4]);
        color("SaddleBrown") translate([0.5+22,0.5+21.5+1.5,0]) cube([3,3,(width+vgap)*4]);
        color("SaddleBrown") translate([0.5,0.5+46,0]) cube([3,3,(width+vgap)*4]);
        color("SaddleBrown") translate([0.5+22,0.5+46,0]) cube([3,3,(width+vgap)*4]);
    }
}

module stair_riser_slashes(y) {
    if(y == 1) {
        color("SaddleBrown") intersection() {
            union() {
                translate([-1.6,0.5,0]) rotate([0,54,0]) cube([3,3,30]);
                translate([27.6,21.5,0]) mirror([1,0,0]) rotate([0,54,0]) cube([3,3,30]);
            }
            translate([3.5,0,0]) cube([19,25,17.5]);
        }
        color("SaddleBrown") intersection() {
            translate([0.5,-1.45,0]) rotate([-52.7,0,0]) cube([2.9,3,30]);
            translate([0,3.5,0]) cube([25,18,17.5]);
        }
    } else if (y == 2) {
        color("SaddleBrown") intersection() {
            union() {
                translate([-1.6,0.5,0]) rotate([0,54,0]) cube([3,3,30]);
                translate([-1.6,46.5,0]) rotate([0,54,0]) cube([3,3,30]);
            }
            translate([3.5,0,0]) cube([19,49.5,17.5]);
        }
        color("SaddleBrown") intersection() {
            translate([0.5,-1.77,0]) rotate([-55.3,0,0]) cube([2.9,3,32]);
            translate([0,3.5,0]) cube([25,20,17.5]);
        }
        color("SaddleBrown") intersection() {
            translate([0.5,51.77,0]) mirror([0,1,0]) rotate([-55.3,0,0]) cube([2.9,3,32]);
            translate([0,3.5+23,0]) cube([25,20,17.5]);
        }
    }
}

x = 1;
y = 1;
//stair_riser(y);
//stair_riser_stairs(y);
//stair_riser_beams(y);
//stair_riser_slashes(y);

module stair(y) {
    for(level = [0:2]) {
        h = y*25-1;
        level_len = 18 - level * 6;
        reduce = h==2 ? 1.025 : 0;
        height = width - reduce;
        color("Cornsilk") translate([0.7,2,(width+vgap)*level]) cube([level_len-1.2,h-3,width+vgap-reduce]);   
        color("Cornsilk") translate([0.5+level_len-2,0.5+1+.5,(width+vgap)*level]) cube([8-1,h-3,1]);
    }
}

module stair_stairs(y) {
    for(level = [0:3]) {
        level_len = 18 - level * 6;
        for(i = [1:y]) {
            intersection() {
                color("SaddleBrown") translate([0.5+level_len+0.2,0.5+(i-1)*25,(width+vgap)*level]) cube([5.8,24,2]);
            }
        }
    }
}
//stair(y);
//stair_stairs(y);

module riser(x,y) {
    color("Cornsilk") translate([1.5,1.5,0]) cube([x*25-3,y*25-3,17.5]);
}

module riser_stairs(x,y) {
    for (i = [0:(x-1)]) {
        for (j = [0:(y-1)]) {
            color("SaddleBrown") translate([0.5+25*i,0.5+25*j,(width+vgap)*4]) cube([24,5.25,2]);
            color("SaddleBrown") translate([0.5+25*i,0.5+25*j+6.25,(width+vgap)*4]) cube([24,5.25,2]);
            color("SaddleBrown") translate([0.5+25*i,0.5+25*j+6.25*2,(width+vgap)*4]) cube([24,5.25,2]);
            color("SaddleBrown") translate([0.5+25*i,0.5+25*j+6.25*3,(width+vgap)*4]) cube([24,5.25,2]);
        }
    }
}

module riser_beams(x,y) {
    color("SaddleBrown") translate([0.5,0.5,0]) cube([3,3,(width+vgap)*4]);
    color("SaddleBrown") translate([0.5,25*y-3.5,0]) cube([3,3,(width+vgap)*4]);
    color("SaddleBrown") translate([25*x-3.5,0.5,0]) cube([3,3,(width+vgap)*4]);
    color("SaddleBrown") translate([25*x-3.5,25*y-3.5,0]) cube([3,3,(width+vgap)*4]);
    if (x == 2) {
        color("SaddleBrown") translate([25-1.5,0.5,0]) cube([3,3,(width+vgap)*4]);

        color("SaddleBrown") translate([25-1.5,25*y-3.5,0]) cube([3,3,(width+vgap)*4]);
    }
    if (y == 2) {
        color("SaddleBrown") translate([0.5,25-1.5,0]) cube([3,3,(width+vgap)*4]);

        color("SaddleBrown") translate([25*x-3.5,25-1.5,0]) cube([3,3,(width+vgap)*4]);
    }
}

//riser(x,y);
//riser_stairs(x,y);
//riser_beams(x,y);

module stair_corner() {
    h = y*25-1;
    color("Cornsilk") translate([0.7,0.7,0]) cube([h-3,h-3,1]);
    for(level = [0:2]) {
        level_len = 18 - level * 6;
        reduce = h==2 ? 1.025 : 0;
        height = width - reduce;
        color("Cornsilk") translate([0.7,0.7,(width+vgap)*level]) cube([level_len-1.2,level_len-1.2,width+vgap-reduce+1]);   
    }
}

module stair_corner_stairs() {
    color("SaddleBrown") translate([0.5+(18)+0.2,0.5,(width+vgap)*level]) cube([5.8,24,2]);
    color("SaddleBrown") translate([0.5,0.5+(18)+0.2,(width+vgap)*level]) cube([24-6.8,5.8,2]);

    color("SaddleBrown") translate([0.5+(18-6)+0.2,0.5,(width+vgap)*1]) cube([5.8,18-6.8,2]);
    color("SaddleBrown") translate([0.5,0.5+(18-6)+0.2,(width+vgap)*1]) cube([18,5.8,2]);

    color("SaddleBrown") translate([0.5+(18-12)+0.2,0.5,(width+vgap)*2]) cube([5.8,12,2]);
    color("SaddleBrown") translate([0.5,0.5+(18-12)+0.2,(width+vgap)*2]) cube([12-6.8,5.8,2]);

    color("SaddleBrown") translate([0.5+0.2,0.5,(width+vgap)*3]) cube([6,6,2]);
}

//stair_corner();
//stair_corner_stairs();

module stair_corner_layer(y, level=0) {
    w = y*25-1;
    odd = level % 2 == 0 ? true : false;
    level_len = 18 - level * 6;
    floor_width = 24 - level * 6;

    if (level_len > 6) {
        translate([0,0,(width+vgap)*level]) layer(level_len,level_len,odd=odd);
    } else {
        color("LightGrey") translate([0.5+1,0.5+1,(width+vgap)*level]) cube([level_len-2,level_len-2,width+vgap+1]);
        color("Grey") translate([0.5,0.5,(width+vgap)*level]) block(level_len,level_len,width,sides_x1[0][0]);
        color("Grey") translate([0.5,0.5,(width+vgap)*(level+1)]) block(level_len,level_len,2,sides_x1[0][1]);
    }

    color("LightGrey") translate([0.5+level_len-2,0.5+1,(width+vgap)*level]) cube([8-1,floor_width-2,1]);
    color("LightGrey") translate([0.5+1,0.5+level_len-2,(width+vgap)*level]) cube([floor_width-2,8-1,1]);
    for(i = [1:y]) {
        intersection() {
            color("Grey") translate([0.5,0.5+(i-1)*25,(width+vgap)*level-4]) block(floor_width,floor_width,6,sides_steps[i*(level+1)]);
            union() {
                color("Grey") translate([0.5+level_len+0.2,0.5+(i-1)*25,(width+vgap)*level]) cube([5.8,floor_width,2]);
                color("Grey") translate([0.5+(i-1)*25,0.5+level_len+0.2,(width+vgap)*level]) cube([floor_width,5.8,2]);
            }
        }
    }
}


