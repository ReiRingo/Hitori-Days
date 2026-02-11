if (_locked)
	exit;

var _len = array_length(_options);
var _prevInd = _index;

if (_state == 0)
{
	if (Input.Pressed(VKey.Down))
	{
		_index = clamp(_index + 1, 0, _len - 1);
	}
	else if (Input.Pressed(VKey.Up))
	{
		_index = clamp(_index - 1, 0, _len - 1);
	}
	
	if (_index != _prevInd)
	{
		if (audio_is_playing(sndBlip))
			audio_stop_sound(sndBlip);
		
		audio_play_sound(sndBlip, 1, false);
	}
}

if (Input.Pressed(VKey.Confirm) && _state == 0)
{
	switch(_index)
	{
		case 0:
			// NEW GAME
			_locked = true;
			audio_sound_gain(_sound, 0, 1000);
			faderFade(0, 1, 30, c_black);
			call_later(
				33, time_source_units_frames,
				function()
				{
					audio_stop_sound(_sound);
					room_goto(_startRoom); // TODO: Make maps soon
					Save.Set(SType.Snapshot, SSnapshot.Room, _startRoom);
					Player.SaveGame();
					faderFade(1, 0, 15, c_black);
				}
			);
			break;
		
		case 1:
			Player.LoadGame();
			var _targetRoom = Save.Get(SType.Snapshot, SSnapshot.Room, -1);
			
			if (room_exists(_targetRoom))
			{
				audio_sound_gain(_sound, 0, 1000);
				faderFade(0, 1, 30, c_black);
				
				_trRoom = _targetRoom;
				
				var _goto = function()
				{
					audio_stop_sound(_sound);
					room_goto(_trRoom); // TODO: Make maps soon
					faderFade(1, 0, 15, c_black);
				};
				
				call_later(
					33, time_source_units_frames,
					_goto
				);
			}
			else
			{
				print("NO!");
			}
			break;
	}
}