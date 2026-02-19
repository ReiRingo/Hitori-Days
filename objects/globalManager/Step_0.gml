if (Input.Pressed("res"))
{
	game_restart();
}

if (_timeHeartbeat == 0)
	States.setTime(States.getTime() + 1);

_timeHeartbeat++;
_timeHeartbeat %= 30;