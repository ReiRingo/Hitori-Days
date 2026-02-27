charId = -1;
_canCollide = true;

// INTERACT EVENT
event = function() {}; // -> void
eventStep = [];
eventCleanUp = [];

_interactable = true;

#region Default Sprites

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

#endregion End of Sprites

_autoAnimate = true;
_leftFlipX = true;

// Direction
dir = DirStates.Down;
dirLocked = false;
dirCanTurn = true;

// -- Movement
// Speed
moveSpeed = 5;

// Movement Handler
_move = [ 0, 0, 0, 0 ];

// -- Do not touch
_wasMoving = false;
_wasIdle = false;
_interacted = false;

/* **************
// -- Follower System
leader = false;

// Pos History Template
function FPosHistory(x, y, dir) constructor {
	self.x = x;
	self.y = y;
	self.dir = dir;
}

// Config
posHistory = [];
followDelay = 16.0;

_maxFollowers = 1;

eventStep[5] = function() {
	if (leader) {
		array_insert(posHistory, 0, new FPosHistory(x, y, dir) );
		
		if (array_length(posHistory) > _maxFollowers * followDelay + 1)
			array_pop(posHistory);
	}
};
*/
