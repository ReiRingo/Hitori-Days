// Inherit the parent event
event_inherited();

var _moveable = (
	_canMove &&
	_canMoveCutscene &&
	_canMoveUi &&
	_canMoveWarp &&
	_canMoveDialogue
);

if (_moveable)
{
	if (Input.Held(VKey.Down))
	{
		_move[DirStates.Down] = 2;
	}
	if (Input.Held(VKey.Up))
	{
		_move[DirStates.Up] = 2;
	}
	if (Input.Held(VKey.Left))
	{
		_move[DirStates.Left] = 2;
	}
	if (Input.Held(VKey.Right))
	{
		_move[DirStates.Right] = 2;
	}
	
	var _inst = noone;
	var _reach = 18;
	var _width = 9;
	
	var _x1, _y1, _x2, _y2;
	
	switch(dir)
	{
	    case DirStates.Left:
	        _x1 = x - _reach;
	        _y1 = y - _width;
	        _x2 = x;
	        _y2 = y + _width;
	        break;
	    
	    case DirStates.Right:
	        _x1 = x;
	        _y1 = y - _width;
	        _x2 = x + _reach;
	        _y2 = y + _width;
	        break;
	
	    case DirStates.Up:
	        _x1 = x - _width;
	        _y1 = y - _reach;
	        _x2 = x + _width;
	        _y2 = y;
	        break;
	
	    case DirStates.Down:
	        _x1 = x - _width;
	        _y1 = y;
	        _x2 = x + _width;
	        _y2 = y + _reach;
	        break;
	}
	
	_debugCol = {
		x : _x1,
		y : _y1,
		x2 : _x2,
		y2 : _y2
	};
	
	_inst = collision_rectangle(_x1, _y1, _x2, _y2, char, false, true);
	
	if (Input.Pressed(VKey.Confirm) && instance_exists(_inst))
	{
		with(_inst)
		{
			if (variable_instance_exists(id, "event") && is_method(event))
	        {
	            event();
	        }
		}
	}
}