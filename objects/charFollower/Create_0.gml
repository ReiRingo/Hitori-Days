// -- Starting Direction
dir = DirStates.Down;

// -- Automatic Sprite Animations
automaticSprites = true;
automaticDir = true;
automaticMove = true;
automaticLeftFlip = true;

// -- Sprites
sprite = [];
{ // Scope block
	var c = SpriteState.Idle;
	var spr = sprite_index;
	repeat(2) {
		sprite[c] = { up: spr, down: spr, right: spr, left: spr, speed: c == SpriteState.Idle ? 0 : 1, frame: c == SpriteState.Move ? 1 : 0 };
		c = SpriteState.Move;
	}
}

// -- External Variables I can use
isMoving = false;
following = true;

// -- Follower Logic
followTarget = charPlayer;
followerIndex = 1;

// Follower Logic Behaviour
behaviour = function() {
	if (!instance_exists(followTarget)) return false;
		
	var history = followTarget.posHistory;								// The position history for the follower to follow
	var frame = followerIndex * followTarget.followerDelay;				// The frame to follow.
	
	if (array_length(history) > frame) {
		var point = history[frame];
		
		x = point.x;											// Snap x to new x set by the position history
		y = point.y;											// Snap y to new y set by the position history
		
		if (automaticDir) dir = point.dir;
		
		return true;
	}
};