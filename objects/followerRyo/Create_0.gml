// Inherit the parent event
event_inherited();

followTarget = charPlayer;
followerIndex = 1;

following = false;

var _c = SpriteState.Idle; // copy paste www
// IDLE
sprite[_c].down = sprCharRyoFront;
sprite[_c].up = sprCharRyoBack;
sprite[_c].left = sprCharRyoSide;
sprite[_c].right = sprCharRyoSide;

// ****
_c = SpriteState.Move;

// MOVE
sprite[_c].down = sprCharRyoFront;
sprite[_c].up = sprCharRyoBack;
sprite[_c].left = sprCharRyoSide;
sprite[_c].right = sprCharRyoSide;
