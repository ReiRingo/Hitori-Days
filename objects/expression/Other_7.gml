if (_ending) {
	instance_destroy();
	exit;
}

_displayIcon = true;
if (audio_exists(audio)) audio_play_sound(audio, 1, false);

image_speed = 0;
image_index = sprite_get_number(sprite_index) - 1;

call_later(endTimer, time_source_units_frames, function() {
	_ending = true;
	_displayIcon = false;
	image_speed = -1;
});