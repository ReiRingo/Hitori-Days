cameraManager.target = _camTarget;


#region -- Warping

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

	if (instance_exists(_inst))
	{
	    x = _inst.x;
	    y = _inst.y;
	
	    // PRE-FILL HISTORY
	    posHistory = [];
	    var _ox = 0;
	    var _oy = 0;
	    
	    switch(dir) {
	        case DirStates.Up:    _oy = 1; break;
	        case DirStates.Down:  _oy = -1; break;
	        case DirStates.Left:  _ox = 1; break;
	        case DirStates.Right: _ox = -1; break;
	    }
		
	    var _maxLen = (followerMax * followerDelay) + 1;
	    for (var i = 0; i < _maxLen; i++) {
	        array_push(posHistory, {
	            x: x + (_ox * i), 
	            y: y + (_oy * i),
	            dir: dir
	        });
	    }
	}
}

#endregion

#region Radio
// TODO: No
#endregion