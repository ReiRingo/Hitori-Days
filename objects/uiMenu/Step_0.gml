var len = array_length(_options);
var prevInd = _index;

if (!_locked && _state == 0 && fader._alpha == 0)
{
	if (Input.isPressed(VKey.Down)) _index = (_index + 1) % len;
	if (Input.isPressed(VKey.Up))   _index = (_index - 1 + len) % len;
	
	if (_index != prevInd)
	{
		if (audio_is_playing(sndBlip)) audio_stop_sound(sndBlip);
		audio_play_sound(sndBlip, 1, false);
		timer = 0; 
	}
}

soundId = MENU_MUS_ID;

if (!_locked && Input.isPressed(VKey.Confirm) && _state == 0 && fader._alpha == 0)
{
	switch(_index)
	{
		case 0:
			audio_play_sound(sndLongerClick, 1, false);
			_locked = true;
			if (audio_is_playing(soundId)) audio_sound_gain(soundId, 0, 1000);
			
			global._loadSnapshots = _load;
			
			faderFade(0, 1, 30, c_black);
			call_later(33, time_source_units_frames, function(sid = soundId)
			{
				
				if (audio_is_playing(sid))
				{
					audio_sound_gain(sid, 1);
					audio_stop_sound(sid);
				}
				
				Player.ClearGame();
				States.Reset();
				room_goto(_startRoom);
				faderFade(1, 0, 15, c_black);
			});
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

var prevLoadIndex = _loadIndex;
if (!_locked && _state == 1 && !_ready)
{
	_ready = true;
}
else if (!_locked && _state == 1 && _ready)
{
	if (fader._alpha == 0 && Input.isPressed(VKey.Down)) _loadIndex = (_loadIndex + 1) % _loadSize;
	else if (fader._alpha == 0 && Input.isPressed(VKey.Up)) _loadIndex = (_loadIndex - 1 + _loadSize) % _loadSize;
	
	else if (fader._alpha == 0 && Input.isPressed(VKey.Cancel))
	{
		_state = 0;
		_loadIndex = 0;
		_ready = false;
	}
	else if (fader._alpha == 0 && Input.isPressed(VKey.Confirm))
	{
		var slotData = _load[_loadIndex];
		if (slotData.available && room_exists(slotData.room))
		{
			audio_play_sound(sndLongerClick, 1, false);
			global._loadSnapshots = _load;
			Save.setSlot(_loadIndex);
			Player.LoadGame();
			_locked = true;
			audio_sound_gain(soundId, 0, 1000);
			faderFade(0, 1, 60, c_white);
			call_later(70, time_source_units_frames, function() {
				States.setTime(Save.get(SType.Snapshot, SSnapshot.Time, 0));
				room_goto(_load[_loadIndex].room);
				faderFade(1, 0, 15, c_black);
			});
		}
		else audio_play_sound(sndBlipNo, 1, false);
	}
}

if (_loadIndex != prevLoadIndex) audio_play_sound(sndBlip, 1, false);

timer++;
if (timer >= 60) timer = 0;

uiVisualIndex = _index; 
zoomLerp = 1.0;