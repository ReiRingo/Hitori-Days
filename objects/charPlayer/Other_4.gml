cameraManager.target = self;

// Warping
if (global.warp.active)
{
	var _tarId = global.warp.spawnpointId;
	var _inst = noone;
	
	if (is_real(_tarId))
	{
		with(devSpawnpoint)
		{
			if (spId == _tarId)
			{
				_inst = id;
				break;
			}
		}
		
		if (instance_exists(_inst))
		{
			x = _inst.x;
			y = _inst.y;
		}
	}
	
	global.warp.active = false;
}