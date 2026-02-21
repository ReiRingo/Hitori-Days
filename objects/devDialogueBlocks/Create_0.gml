event_inherited();

text = ["[rainbow][wave]Beans (Placeholder)[/c][/wave]"];

call_later(1, time_source_units_frames, function() {
	event = function() {
		if (is_array(text) || is_string(text)) dialogueStart(text);
	}
});