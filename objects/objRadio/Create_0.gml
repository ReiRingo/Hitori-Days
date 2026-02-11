event_inherited();

_onUi = false;
dirLocked = true;
_leftFlipX = false;

event = function()
{
	with(charPlayer)
	{
		_canMoveUi = false;
	}
	
	_onUi = true;
};