// Inherit the parent event
event_inherited();

targetRoom = room;
targetSp = 0;

_time = 15;
_timeOut = 15;
_colour = c_black;
_repeat = true;

event = function()
{
	Player.Warp(targetRoom, targetSp, _time, _timeOut, _colour);
};