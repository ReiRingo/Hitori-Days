// -- Shake logic
if (_shake > 0)
{
	--_shake;
	shakeOffset.x = floor(random_range(-_intensity, _intensity));
	shakeOffset.y = floor(random_range(-_intensity, _intensity));
}
else
{
	shakeOffset.x = 0;
	shakeOffset.y = 0;
	_shake = 0;
}

// --- Apply to Camera ---
var _targetX = (target != noone) ? target.x : x;
var _targetY = (target != noone) ? target.y : y;

var _camX = _targetX - (baseWidth / 2);
var _camY = _targetY - (baseHeight / 2);

if (roomBound)
{
	_camX = clamp(_camX, 0, room_width - baseWidth);
	_camY = clamp(_camY, 0, room_height - baseHeight);
}

_camX += shakeOffset.x;
_camY += shakeOffset.y;

camera_set_view_pos(view_camera[0], _camX, _camY);

if (Input.Pressed("fc"))
{
	window_set_fullscreen(!window_get_fullscreen());
}