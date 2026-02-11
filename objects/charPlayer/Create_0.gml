// Inherit the parent event
event_inherited();

charId = 0;

sprite[SpriteState.Idle].down = sprPlayerFront;
sprite[SpriteState.Idle].up = sprPlayerBack;
sprite[SpriteState.Idle].left = sprPlayerSide;
sprite[SpriteState.Idle].right = sprPlayerSide;
sprite[SpriteState.Idle].speed = 0;

sprite[SpriteState.Move].down = sprPlayerFront;
sprite[SpriteState.Move].up = sprPlayerBack;
sprite[SpriteState.Move].left = sprPlayerSide;
sprite[SpriteState.Move].right = sprPlayerSide;
sprite[SpriteState.Move].speed = 1;

moveSpeed = 5;

// -- States
_canMove = true;
_canMoveUi = true;
_canMoveCutscene = true;
_canMoveWarp = true;

// -- Debug
_debugging = false;
_debugCol = { x : x, y : y, x2 : x, y2 : y };