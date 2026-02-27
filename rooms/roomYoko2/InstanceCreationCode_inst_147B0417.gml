image_index = 1;

// This is gonna be the manager for now, www

shi = call_later(irandom_range(50, 100), time_source_units_frames, function() {
	var _inst = noone;
	if (irandom(1)) {
		_inst = instance_create_depth(room_width + 64, 464, 0, charCars);
	} else {
		_inst = instance_create_depth(-64, 464 + 16, 0, charCars);
		_inst.image_xscale = -1;
	}
	
	with(_inst) {
		// Audio
		theHum = audio_play_sound(sndEngineHum, 1, 1, 0);
		
		eventStep[1] = function() {
			// If close to player, play sound gain better
			var _dist = point_distance(x, y, charPlayer.x, charPlayer.y);
			var _distMax = 400.0;
			var _gain = clamp(1 - (_dist / _distMax), 0.0, 1.0);
			
			// Apply Gain
			audio_sound_gain(theHum, _gain);
		};
		
		// Clean Up
		eventCleanUp[1] = function() {
			var _time = 18;
			audio_sound_gain(theHum, 0, (_time / 30) * 1000);
			
			call_later(_time, time_source_units_frames, function() {
				audio_stop_sound(theHum);
			});
		};
	}
}, true);

eventCleanUp[0] = function() { call_cancel(shi) };