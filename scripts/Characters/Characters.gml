function charWalk(chars, tx, ty) {
	for (var i = 0; i < 4; ++i) {
		chars.move[i] = 0;
	}
	
	var dx = tx - chars.x;
	var dy = ty - chars.y;
	
	if (dx == 0 && dy == 0) return false;
	
	var _stepSpeed = chars.moveSpeed / 2;
	
	// Integer-fy hehe
	if (dx > 0) chars._move[DirStates.Right] = ceil(abs(dx) / _stepSpeed);
	if (dx < 0) chars._move[DirStates.Left]  = ceil(abs(dx) / _stepSpeed);
	
	if (dy > 0) chars._move[DirStates.Down] = ceil(abs(dy) / _stepSpeed);
	
	if (dy < 0) chars._move[DirStates.Up] = ceil(abs(dy) / _stepSpeed);
	
	return true;
}