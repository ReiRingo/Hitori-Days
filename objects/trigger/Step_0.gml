var _result = false;
var _tar = targetId;

if (instance_exists(char))
{
	with(char)
	{
		charId = (!variable_instance_exists(self, "charId") || charId == undefined) ? -1 : charId;
		
		if (charId == _tar)
		{
			if (place_meeting(x, y, other))
			{
				_result = true;
				break;
			}
		}
	}
}

if (_result)
{
	if (!_triggered)
	{
		event();
		_triggered = true;
	}
}
else
{
	if (_triggered && !_offTrigger)
	{
		_offTrigger = true;
		eventOff();
	}
	if (_repeat)
	{
		_triggered = false;
		_offTrigger = false;
	}
}