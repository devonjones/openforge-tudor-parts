tile_num = 0;
render_tile = false;

module floor_block_load(f, path="../parts/") {
    //x,y,z
    //0,0,0
    //0,1,0
    //0,2,0
    //0,3,0
    //1,0,0
    //-1,0,0
    transform = f % 6;
    side = floor(transform % 6);
    block = floor(f / 6);
    echo(str("selection: ", floor(f), " side: ", side, " block: ", block));
    
    if (side < 4) {
        x = side;
        y = 0;
    } else {
        x = 0;
        if (side == 4) {
            y = 1;
        } else {
            y = -1;
        }
    }
    rotate([side < 4 ? side*90:0,0]) import(str(path, "blocks/block_light_pitting_", block < 10 ? "0":"", block, ".stl"));
}

module cut_stone_tile(tile_num, path="../../../cut_stone/parts/") {
    intersection() {
        //color("Grey") scale([xhalf ? 1.15 : 2.4, yhalf ? 1.15 : 2.4, 1]) cube([10,10,10]);
        color("Grey") scale([2.4, 2.4, 1]) translate([5.25, 5.25, -.5]) floor_block_load(tile_num,path=path);
        translate([0,0,1.5]) color("Grey") cube([25,25,3]);
    }
    translate([1.2,1.2,0]) cube([22.6,22.6,2]);
}

if (render_tile) {
    cut_stone_tile(tile_num);
}
