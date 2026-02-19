charId = -1;
_canCollide = true;

// INTERACT EVENT
event = function()
{
	// PASS
};
_interactable = true;

sprite = [];
sprite[SpriteState.Idle] =
{
	up: sprite_index,
	down: sprite_index,
	left: sprite_index,
	right: sprite_index,
	speed: 0,
	frame: 0
};
sprite[SpriteState.Move] =
{
	up: sprite_index,
	down: sprite_index,
	left: sprite_index,
	right: sprite_index,
	speed: 1,
	frame: 1
};

_autoAnimate = true;
_leftFlipX = true;

// Direction
dir = DirStates.Down;
dirLocked = false;
dirCanTurn = true;

// -- Movement
// Speed
moveSpeed = 3; // This is running on 30 FPS, after all

// Movement Handler
_move = [ 0, 0, 0, 0 ];

// -- Do not touch
_wasMoving = false;
_wasIdle = false;