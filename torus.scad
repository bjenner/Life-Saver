module torus(r1 = 3,r2 = 3,fn = 10){
   for (i = [1: fn]){
   rotate([90,0,360 / fn * i])translate([r1 ,0,0])cylinder(h = 2 * (r1 + r2) * 3.14 / fn,r = r2,center = true,$fn = fn);
       }
}
torus(r1 = 10,r2 = 3,fn = 40);
