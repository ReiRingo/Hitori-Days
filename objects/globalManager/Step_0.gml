if (Input.Pressed("res"))
{
	game_restart();
}

if (_timeHeartbeat == 0)
	States.SetTime(States.GetTime() + 1);

_timeHeartbeat++;
_timeHeartbeat %= 30;