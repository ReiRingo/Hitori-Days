// Inherit the parent event
event_inherited();

var _speed = 10;

if (_running) x = (sign(image_xscale) == 1) ? x - _speed : x + _speed;

if (image_xscale > 0) {
	if (x <= -64)
		instance_destroy();
} else {
	if (x >= room_width + 64)
		instance_destroy();
}