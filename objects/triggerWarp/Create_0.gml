// Inherit the parent event
event_inherited();

targetRoom = room;
targetId = 0;

_time = 30;
_timeOut = 15;
_colour = c_black;

event = function()
{
	Player.Warp(targetRoom, targetId, _time, _timeOut, _colour);
};