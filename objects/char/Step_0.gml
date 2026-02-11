// -- Prevs
var _prevDir = dir;
var _prevPos = { x: x, y: y };

// -- Movement
var _vx = 0;
var _vy = 0;

for (var i = 0; i < 4; ++i)
{
    if (_move[i] > 0)
    {
        switch(i)
        {
            case DirStates.Right: _vx += moveSpeed / 2; break;
            case DirStates.Left:  _vx -= moveSpeed / 2; break;
            case DirStates.Up:    _vy -= moveSpeed / 2; break;
            case DirStates.Down:  _vy += moveSpeed / 2; break;
        }
		
        if (!dirLocked) dir = i;
		
        _move[i] = max(0, _move[i] - 1);
        state = SpriteState.Move;
    }
}

if (_vx != 0)
{
    var _colX = instance_place(x + _vx, y, collision);
    if (instance_exists(_colX) && _colX._canCollide)
    {
        // Pixel-perfect snap to wall (optional but recommended)
        while (!place_meeting(x + sign(_vx), y, collision)) {
            x += sign(_vx);
        }
        _vx = 0;
    }
    x += _vx;
}

// 3. Vertical Collision & Movement
if (_vy != 0)
{
    var _colY = instance_place(x, y + _vy, collision);
    if (instance_exists(_colY) && _colY._canCollide)
    {
        // Pixel-perfect snap to wall
        while (!place_meeting(x, y + sign(_vy), collision)) {
            y += sign(_vy);
        }
        _vy = 0;
    }
    y += _vy;
}


var _moving = (
	(
		_move[DirStates.Down] != 0 ||
		_move[DirStates.Up] != 0 ||
		_move[DirStates.Left] != 0 ||
		_move[DirStates.Right] != 0
	) && (x != _prevPos.x || y != _prevPos.y)
);

if (_autoAnimate)
{
	var _st = _moving ? SpriteState.Move : SpriteState.Idle;
	var _data = sprite[_st];
	
	var _keys = ["right", "up", "left", "down"];
	var _key  = _keys[dir];
	
	sprite_index = _data[$ _key];
	image_speed  = _data.speed;

	if (_leftFlipX)
	{
		image_xscale = (dir == DirStates.Left) ? -abs(image_xscale) : abs(image_xscale);
	}
	
    if (_moving && !_wasMoving) {
        image_index = _data.frame;
        _wasMoving = true;
        _wasIdle = false;
    } else if (!_moving && !_wasIdle) {
        image_index = _data.frame;
        _wasIdle = true;
        _wasMoving = false;
    }
}