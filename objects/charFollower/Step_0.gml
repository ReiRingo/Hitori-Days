var previousPos = { x: x, y: y };
if (following) behaviour();
isMoving = !(previousPos.x == x && previousPos.y == y);

// -- The automatic spriting (Can be overriden)
if (automaticSprites) {
	var targetState = isMoving ? SpriteState.Move : SpriteState.Idle;
	
	var data = sprite[targetState];
	var keys = [ "right", "up", "left", "down" ];
	var key = keys[dir];
	
	sprite_index = data[$ key];
	image_speed = data.speed;
	
	image_xscale = dir == DirStates.Left ? -abs(image_xscale) : abs(image_xscale);
	
	if (isMoving && image_index == 0 && targetState == SpriteState.Move) image_index = data.frame;
}