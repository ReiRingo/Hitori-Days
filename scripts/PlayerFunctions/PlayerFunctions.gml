function __playerLib() constructor
{
	static SaveGame = function()
	{
		Save.saveToDisk(SType.Snapshot);
		Save.saveToDisk(SType.Cutscenes);
	};
	
	static LoadGame = function(check = 0)
	{
		var _snap = Save.loadFromDisk(SType.Snapshot);
		var _cut = Save.loadFromDisk(SType.Cutscenes);
		
		switch(check)
		{
			case 0:
			default:
				return (_snap && _cut);
				break;
			
			case 1:
				return _snap;
				break;
			
			case 2:
				return _cut;
				break;
		}
	};
	
	static ClearGame = function()
	{
		var _target = [
			SType.Snapshot,
			SType.Cutscenes
		];
		
		var _size = array_length(_target);
		var _proc = 0;
		repeat(_size)
		{
			Save.clear(_target[_proc]);
			_proc++;
		}
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
	
	static MapName = function(rm = room)
	{
		var _out = "";
		switch(rm)
		{
			default:
				_out = room_get_name(rm);
				break;
			
			case roomBocchiRoom:
				_out = Lang.get("save_room_bocchi");
				break;
			
			case roomYoko1:
				_out = Lang.get("save_room_yoko1");
				break;
		}
		return _out;
	};
}

#macro Player global.playerFuncLib

Player = new __playerLib();