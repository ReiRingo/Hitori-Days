image_index = 1;

// This is gonna be the manager for now, www

shi = call_later(irandom_range(50, 100), time_source_units_frames, function() {
	var _inst = noone;
	if (irandom(1)) {
		_inst = instance_create_depth(room_width + 64, 464 + 16, 0, charCars);
	} else {
		_inst = instance_create_depth(-64, 464, 0, charCars);
		_inst.image_xscale = -1;
	}
	
	with(_inst) {
		s_emit = audio_emitter_create();
		audio_emitter_position(s_emit, x, y, 0);

		s_sound = -1;
		
		audio_emitter_falloff(s_emit, 100, 500, 1);
		s_sound = audio_play_sound_on(s_emit, sndEngineHum, true, 10, 0);
		audio_sound_gain(s_sound, 1, 400);
		
		eventStep[1] = function() {
			audio_emitter_position(s_emit, x, y, 0);
		};
		
		// Clean Up
		eventCleanUp[1] = function() {
			var _time = 18;
			audio_sound_gain(s_sound, 0, (_time / 30) * 1000);
			
			call_later(_time, time_source_units_frames, function() {
				audio_stop_sound(s_sound);
				audio_emitter_exists(s_emit) audio_emitter_free(s_emit);
			});
		};
	}
}, true);

eventCleanUp[0] = function() { call_cancel(shi) };