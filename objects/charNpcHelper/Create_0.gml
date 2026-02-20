// Inherit the parent event
event_inherited();

sprite[SpriteState.Idle].up = sprCharGuitarFriendBack;
sprite[SpriteState.Idle].down = sprCharGuitarFriendFront;
sprite[SpriteState.Idle].left = sprCharGuitarFriendFront;
sprite[SpriteState.Idle].right = sprCharGuitarFriendFront;
_leftFlipX = false;

sprite[SpriteState.Idle].speed = 1;