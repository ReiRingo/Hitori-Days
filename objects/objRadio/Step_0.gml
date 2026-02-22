event_inherited();

if (!_onUi)
	exit;

// ...
var _prev = {
	index : global.radio.index
};

// -- Songs
var _songs = global.radio.songs;
var _len = array_length(_songs);

// -- Inputs
var _up, _down;
_up = Input.isPressed(VKey.Up);
_down = Input.isPressed(VKey.Down);

// -- Logic!
if (_up)
{
	if (global.radio.index > 0)
	{
		global.radio.index--;
	}
} else if (_down)
{
	if (global.radio.index < _len - 1)
	{
		global.radio.index++;
	}
}

var _ind = global.radio.index;

if (global.radio.index != _prev.index)
{
	if (audio_exists(_songs[_ind]))
	{
		for (var i = 0; i < _len; ++i)
		{
			if (audio_is_playing(_songs[i]))
				audio_stop_sound(_songs[i]);
		}
		audio_play_sound(_songs[_ind], 1, true);
		global.radio.overriden = true;
	}
	else
	{
		for (var i = 0; i < _len; ++i)
		{
			if (audio_is_playing(_songs[i]))
				audio_stop_sound(_songs[i]);
		}
		global.radio.overriden = false;
	}
}

if (Input.isPressed(VKey.Cancel))
{
	_onUi = false;
	with(charPlayer)
	{
		_canMoveUi = true;
	}
}