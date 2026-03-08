/// @description The weird background

var loopDuration = 360; 
var progress = (timer % loopDuration) / loopDuration;
var loopAngle = progress * pi * 2;

var segmentHeight = 4;
var pink = make_colour_rgb(238, 95, 141);
var deepRed = make_colour_rgb(80, 0, 20);

for (var i = 0; i < room_height; i += segmentHeight) {
    var vertOffset = (i / room_height) * pi * 4;
    
    var waveX = sin(loopAngle + vertOffset) * 20;
    
    var glitchTrigger = frac(sin(i * 543.21 + floor(timer / 5)) * 43758.54); 
    var jitter = (glitchTrigger > 0.97) ? sin(i) * 15 : 0;
    
    var xShift = waveX + jitter;
    
    var dynamicWidth = 70 + cos(loopAngle * 2 + vertOffset * 0.5) * 30;
    
    var x1 = (room_width / 2 - dynamicWidth) + xShift;
    var x2 = (room_width / 2 + dynamicWidth) + xShift;
    
    var alphaBase = 0.4 + (sin(loopAngle + vertOffset) * 0.15);
    
    draw_set_alpha(alphaBase);
    draw_rectangle_colour(x1, i, x2, i + segmentHeight, pink, pink, deepRed, deepRed, false);
}

draw_set_alpha(1);
draw_self();
drawReset();