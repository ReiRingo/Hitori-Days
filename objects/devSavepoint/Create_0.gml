// Inherit the parent event
event_inherited();

dirLocked = true;
sprite[SpriteState.Idle].speed = 1;

text = ["It's a save point!"];
_isEvent = false;

var _func = function()
{
	event = function()
	{
		dialogueStart(text);
		_isEvent = true;
	};
};

call_later(1, time_source_units_frames, _func);