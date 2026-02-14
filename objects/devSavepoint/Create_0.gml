// Inherit the parent event
event_inherited();

dirLocked = true;
sprite[SpriteState.Idle].speed = 1;

text = Lang.Get("save_point");
_isEvent = false;
_isSave = false;
_saved = false;
_saveIndex = 0;
_saveSize = 3;

_load = global._loadSnapshots;

var _func = function()
{
	event = function()
	{
		with(charPlayer)
			_canMoveSaving = false;
		
		_isSave = false;
		dialogueStart(text);
		_isEvent = true;
	};
};

call_later(1, time_source_units_frames, _func);