event_inherited();

_onUi = false;
dirLocked = true;

event = function()
{
	// print("Hello!");
	with(charPlayer)
	{
		_canMoveUi = false;
	}
	
	_onUi = true;
};