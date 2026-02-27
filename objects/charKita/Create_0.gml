// Inherit the parent event
event_inherited();

var _c;

_c = SpriteState.Idle;

repeat(2) {
	sprite[_c].down = sprCharKitaFront;
	sprite[_c].up = sprCharKitaBack;
	sprite[_c].left = sprCharKitaSide;
	sprite[_c].right = sprCharKitaSide;
	
	_c = SpriteState.Move;
}