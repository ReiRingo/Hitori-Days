// MENU
var _len = array_length(_options);
var _prevInd = _index;

if (!_locked && _state == 0 && fader._alpha == 0)
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

if (!_locked && Input.Pressed(VKey.Confirm) && _state == 0 && fader._alpha == 0)
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
			_state = 1;
			break;
	}
}

var _prevLoadIndex = _loadIndex;
if (!_locked && _state == 1 && !_ready)
{
	_ready = true;
}
else if (!_locked && _state == 1 && _ready)
{
	if (fader._alpha == 0 && Input.Pressed(VKey.Down))
	{
		_loadIndex = (_loadIndex < _loadSize - 1) ? _loadIndex + 1 : 0;
	}
	else if (fader._alpha == 0 && Input.Pressed(VKey.Up))
	{
		_loadIndex = (_loadIndex > 0) ? _loadIndex - 1 : _loadSize - 1;
	}
	else if (fader._alpha == 0 && Input.Pressed(VKey.Cancel))
	{
		_state = 0;
		_loadIndex = 0;
		_ready = false;
	}
	else if (fader._alpha == 0 && Input.Pressed(VKey.Confirm))
	{
		var _ind = _load[_loadIndex];
		
		if (_ind.available)
		{
			var _func = function()
			{
				room_goto(_load[_loadIndex].room);
				faderFade(1, 0, 15, c_black);
			};
			
			if (room_exists(_ind.room))
			{
				Save.SetSlot(_loadIndex);
				Player.LoadGame();
				_locked = true;
				audio_sound_gain(_sound, 0, 1000);
				faderFade(0, 1, 60, c_white);
				call_later(
					70, time_source_units_frames,
					_func
				);
			}
		}
	}
}

if (_loadIndex != _prevLoadIndex)
{
	audio_play_sound(sndBlip, 1, false);
}