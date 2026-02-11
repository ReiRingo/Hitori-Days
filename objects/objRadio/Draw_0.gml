draw_self();

var _pos = {
	x : cameraManager.x + Camera.Width,
	y : cameraManager.y
};

if (_onUi)
{
	var _marg = 10;
	drawPanel(_pos.x + _marg, _pos.y + _marg, 20, 35);
}