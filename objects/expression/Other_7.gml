if (_ending) instance_destroy();

_displayIcon = true;

image_speed = 0;
image_index = sprite_get_number(sprite_index) - 1;

call_later(endTimer, time_source_units_frames, function() {
	_ending = true;
	_displayIcon = false;
	image_speed = -1;
});