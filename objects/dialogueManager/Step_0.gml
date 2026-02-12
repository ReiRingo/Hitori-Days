if (_ready)
{
	if (!_animating)
	{
		if (!_typing)
		{
			_typing = true;
			event_user(0);
		}
		else
		{
			if (_typist.get_state() == 1.0)
			{
				if (Input.Pressed(VKey.Confirm)
				|| Input.Pressed(VKey.Cancel))
				{
					_typist.reset();
					_pageIndex++;
					event_user(0);
				}
			}
		}
	}
	
	with(charPlayer)
	{
		_canMoveDialogue = false;
	}
}