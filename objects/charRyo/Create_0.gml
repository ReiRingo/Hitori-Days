event_inherited();

var _c = SpriteState.Idle; // copy paste www
// IDLE
sprite[_c].down = sprCharRyoFront;
sprite[_c].up = sprCharRyoBack;
sprite[_c].left = sprCharRyoSide;
sprite[_c].right = sprCharRyoFront;

// ****
_c = SpriteState.Move;

// MOVE
sprite[_c].down = sprCharRyoFront;
sprite[_c].up = sprCharRyoBack;
sprite[_c].left = sprCharRyoSide;
sprite[_c].right = sprCharRyoFront;