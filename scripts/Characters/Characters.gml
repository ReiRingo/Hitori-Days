function charWalk(chars, tx, ty)
{
	chars._move[DirStates.Up]    = 0;
	chars._move[DirStates.Down]  = 0;
	chars._move[DirStates.Left]  = 0;
	chars._move[DirStates.Right] = 0;
	
	var dx = tx - chars.x;
	var dy = ty - chars.y;
	
	if (dx == 0 && dy == 0) return false;
	
	var _stepSpeed = chars.moveSpeed / 2;
	
	if (dx > 0) chars._move[DirStates.Right] = abs(dx) / _stepSpeed;
	if (dx < 0) chars._move[DirStates.Left]  = abs(dx) / _stepSpeed;
	
	if (dy > 0) chars._move[DirStates.Down]  = abs(dy) / _stepSpeed;
	if (dy < 0) chars._move[DirStates.Up]    = abs(dy) / _stepSpeed;
	
	return true;
}