if (_started)
{
	_blackAlpha = mapValue(
		sin(current_time / 900),
		[ -1, 1 ],
		[ 0, 0.7 ]
	);
	
	_offsetYSin = sin(current_time / 600) * 8;
	
	if (Input.isPressed(VKey.Confirm) && !_starting && fader._alpha == 0)
	{
		audio_play_sound(sndLongerClick, 1, false);
		_starting = true;
		audio_stop_sound(_music);
		faderFade(0, 1, 30, c_black);
		var _func = function()
		{
			room_goto(roomMainMenu);
			faderFade(1, 0, 30, c_black);
		};
		call_later(
			30, time_source_units_frames,
			_func
		);
	}
	
	_heartbeat++;
	_heartbeat %= 2;
	
	if (_heartbeat == 0)
	{
		array_insert(trail_history, 0, _offsetYSin);
		
		if (array_length(trail_history) > 20)
		{
			array_pop(trail_history);
		}
	}
}

