function __playerLib() constructor
{
	static SaveGame = function()
	{
		Save.SaveToDisk(SType.Snapshot);
		Save.SaveToDisk(SType.Cutscenes);
	};
	
	static LoadGame = function()
	{
		Save.LoadToDisk(SType.Snapshot);
		Save.LoadToDisk(SType.Cutscenes);
	};
	
	static Warp = function(room, spawnpointId, time = 15, timeOut = 15, col = c_black)
	{
		global.warp.room = room;
		global.warp.spawnpointId = spawnpointId;
		
		faderFade(fader._alpha, 1, time, col);
		
		if (instance_exists(charPlayer))
		{
			with(charPlayer)
			{
				_canMoveWarp = false;
				global.warp.active = true;
			}
		}
		else
		{
			return false;
		}
		global.warp._t = timeOut;
		global.warp._c = col;
		
		var _func = function()
		{
			room_goto(global.warp.room);
			faderFade(fader._alpha, 0, global.warp._t, global.warp._c);
			if (instance_exists(charPlayer))
			{
				with(charPlayer)
				{
					_canMoveWarp = true;
				}
			}
		};
		
		call_later(time + 1, time_source_units_frames, _func);
		
		return true;
	};
}

#macro Player global.playerFuncLib

Player = new __playerLib();