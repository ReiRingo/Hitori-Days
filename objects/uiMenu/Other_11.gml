/// @desc Draw Wiggly

var space = 70;
var waveAmplitude = 4; // How far it swings left/right
var waveFrequency = 0.1; // How "tight" the waves are
var segmentHeight = 5;   // Smaller = smoother waves, but more performance cost
var pink = make_colour_rgb(238, 95, 141);
draw_set_colour(pink);

// Loop through the screen height in chunks
for (var i = 0; i < room_height; i += segmentHeight) {
    
    // Calculate the horizontal shift for this specific slice
    // Adding (i * 0.05) so the whole thing doesn't move as one block
    var xShift = sin(timer + (i * waveFrequency)) * waveAmplitude;
    
	// Coords
    var x1 = (room_width / 2 - space) + xShift;
    var y1 = i;
    var x2 = (room_width / 2 + space) + xShift;
    var y2 = i + segmentHeight;
    
	// Rectangle
	draw_set_alpha(0.5);
    draw_rectangle(x1, y1, x2, y2, false);
	draw_set_alpha(1);
	
	// Bocchi
	draw_self();
}

drawReset();