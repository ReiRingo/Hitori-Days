// MENU
var _len = array_length(_options);
var _prevInd = _index;

if (!_locked && _state == 0 && fader._alpha == 0)
{
	if (Input.isPressed(VKey.Down))
	{
		_index = clamp(_index + 1, 0, _len - 1);
	}
	else if (Input.isPressed(VKey.Up))
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

if (!_locked && Input.isPressed(VKey.Confirm) && _state == 0 && fader._alpha == 0)
{
	switch(_index)
	{
		case 0:
			// NEW GAME
			audio_play_sound(sndSelect, 1, false);
			_locked = true;
			audio_sound_gain(_sound, 0, 1000);
			global._loadSnapshots = _load;
			
			faderFade(0, 1, 30, c_black);
			call_later(
				33, time_source_units_frames,
				function()
				{
					audio_stop_sound(_sound);
					Player.ClearGame();
					States.Reset();
					room_goto(_startRoom);
					faderFade(1, 0, 15, c_black);
				}
			);
			break;
		
		case 1:
			_state = 1;
			audio_play_sound(sndSelect, 1, false);
			break;
		
		case 2:
			audio_play_sound(sndSelect, 1, false);
			room_goto(roomSettings);
			break;
		
		case 3:
			game_end();
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
	if (fader._alpha == 0 && Input.isPressed(VKey.Down))
	{
		_loadIndex = (_loadIndex < _loadSize - 1) ? _loadIndex + 1 : 0;
	}
	else if (fader._alpha == 0 && Input.isPressed(VKey.Up))
	{
		_loadIndex = (_loadIndex > 0) ? _loadIndex - 1 : _loadSize - 1;
	}
	else if (fader._alpha == 0 && Input.isPressed(VKey.Cancel))
	{
		_state = 0;
		_loadIndex = 0;
		_ready = false;
	}
	else if (fader._alpha == 0 && Input.isPressed(VKey.Confirm))
	{
		var _ind = _load[_loadIndex];
		
		if (_ind.available)
		{
			var _func = function()
			{
				States.setTime(Save.get(SType.Snapshot, SSnapshot.Time, 0));
				room_goto(_load[_loadIndex].room);
				faderFade(1, 0, 15, c_black);
			};
			
			if (room_exists(_ind.room))
			{
				audio_play_sound(sndLongerClick, 1, false);
				global._loadSnapshots = _load;
				Save.setSlot(_loadIndex);
				Player.LoadGame();
				_locked = true;
				audio_sound_gain(_sound, 0, 1000);
				faderFade(0, 1, 60, c_white);
				call_later(
					70, time_source_units_frames,
					_func
				);
			}
			else
			{
				print("-- POSSIBLE ROOM LOADING ERROR! --");
				audio_play_sound(sndBlipNo, 1, false);
			}
		}
		else
			audio_play_sound(sndBlipNo, 1, false);
	}
}

if (_loadIndex != _prevLoadIndex)
{
	audio_play_sound(sndBlip, 1, false);
}