// Inherit the parent event
event_inherited();

if (_isEvent)
{
	if (!instance_exists(dialogueManager))
	{
		_isSave = true;
		_isEvent = false;
	}
}
else if (_isSave)
{
	var _lastInd = _saveIndex;
	
	if (Input.isPressed(VKey.Down))
		_saveIndex = (_saveIndex < _saveSize - 1) ? _saveIndex + 1 : 0;
	else if (Input.isPressed(VKey.Up))
		_saveIndex = (_saveIndex > 0) ? _saveIndex - 1 : _saveSize - 1;
	
	if (_lastInd != _saveIndex)
		audio_play_sound(sndBlip, 1, false);
	
	if (Input.isPressed(VKey.Confirm))
	{
		Save.set(SType.Snapshot, SSnapshot.Room, States.GetRoom());
		Save.set(SType.Snapshot, SSnapshot.Time, States.getTime());
		Save.set(SType.Snapshot, SSnapshot.Yen, States.getYen());
		Save.setSlot(_saveIndex);
		Player.SaveGame();
		_saved = true;
		_isSave = false;
		_load[_saveIndex].available = true;
		_load[_saveIndex].room = room;
		_load[_saveIndex].time = Save.get(SType.Snapshot, SSnapshot.Time, 0);
		_load[_saveIndex].money = Save.get(SType.Snapshot, SSnapshot.Yen, 0);
		global._loadSnapshots = _load;
		audio_play_sound(sndLongerClick, 1, false);
	}
	else if (Input.isPressed(VKey.Cancel))
	{
		_isEvent = false;
		_isSave = false;
		_saved = false;
		with(charPlayer)
			_canMoveSaving = true;
	}
}
else if (_saved)
{
	if (Input.isPressed(VKey.Confirm) || Input.isPressed(VKey.Cancel))
	{
		_isEvent = false;
		_isSave = false;
		_saved = false;
		with(charPlayer)
			_canMoveSaving = true;
	}
}