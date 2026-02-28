// The icon displayed in the expression bubble
icon = -1;
iconIndex = 0;
endTimer = 34;
target = noone;
targetOffset = vec2(0, -36);
audio = -1;

// Internal logic
_ready = false;
_displayIcon = false;
_ending = false;

// Internal Config
image_index = 0;
image_speed = 0;
image_alpha = 0;

// Running
call_later(2, time_source_units_frames, function() {
	_ready = true;
	image_speed = 1;
	image_alpha = 1;
});