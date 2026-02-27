// -- Loop
_time = 2 * 30;
_state = DirStates.Right; // 0 1 2 3

shi = call_later(_time + 15, time_source_units_frames, function() {
	if (!_interacted) {
		_move[_state] = _time;
		_state = ( _state + 1 ) % 4; // Square!
	}
}, true);

event = function() {
	var _f = Save.get(SType.Cutscenes, "cherry_cutie", false);
	
	/*
	{ // Scope blocks
		var _proc = 0;
		repeat(4) {
			_move[_proc] = 0;
			++_proc;
		}
	}
	*/
	
	_move = [0, 0, 0, 0];
	
	if (!_f) {
		dialogueStart(Lang.get("dialogue_cherry1"));
		Save.set(SType.Cutscenes, "cherry_cutie", true);
	} else {
		dialogueStart(Lang.get("dialogue_cherry2"));
	}
	
	_interacted = true;
};

eventStep[0] = function() {
	if (_interacted && !instance_exists(dialogueManager)) {
		_interacted = false;
	}
};

eventCleanUp[0] = function() { call_cancel(shi) };