if (_resetting)
	exit;

if (_timer > 30 * 2 && !_ready && !_skipping)
{
	if (!_ready)
		event_user(0);
	_ready = true;
}
else
{
	if (!_ready)
		_timer++;
}

if (Input.Pressed(VKey.Confirm))
{
	if (!_skipping)
	{
		if (!_ready)
			event_user(0);
		
		_skipping = true;
	}
}