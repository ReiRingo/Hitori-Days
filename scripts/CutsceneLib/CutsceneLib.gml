#macro Cutscene global.cutFuncLib

Cutscene =
{
	Create: function()
	{
		return instance_create_depth(0, 0, 0, cutsceneManager);
	},
	
	Custom: function(cut, struct)
	{
		array_push(cut._queue, struct);
	},
	
	Function: function(cut, func)
	{
		Cutscene.Custom(cut, {
			init: func,
			update: false
		});
	},
	
	PlayerMoveable: function(cut, moveable)
	{
		Cutscene.Custom(cut, {
			moveBool: moveable,
			init: function()
			{
				if (instance_exists(charPlayer))
					charPlayer._canMoveCutscene = moveBool;
			},
			update: false
		});
	},
	
	MoveChar: function(cut, targetChar, directionState, amount, wait = true)
	{
		Cutscene.Custom(cut, {
			_character: targetChar,
			wait: wait,
			dir: directionState,
			amt: amount,
			init: function()
			{
				_character._move[dir] = amt;
				print($"MOVING :: YES");
			},
			update: function()
			{
				if (!wait)
					return false;
				return (_character._move[dir] != 0);
			}
		});
	},
	
	MoveCharTarget: function(cut, chars, tx, ty, wait = true)
	{
		self.Custom(
			cut,
			{
				chars: chars,
				tVec: [tx, ty],
				wait: wait,
				init: function()
				{
					charWalk(chars, tVec[0], tVec[1]);
				},
				update: function()
				{
					if (!wait) 
						return false;
					
					var _updating = (
						chars._move[DirStates.Down] != 0 ||
						chars._move[DirStates.Up] != 0 ||
						chars._move[DirStates.Right] != 0 ||
						chars._move[DirStates.Left] != 0
					);
					
					return _updating;
				}
			}
		);
	},
	
	Wait: function(cut, frames)
	{
		Cutscene.Custom(cut, {
			timer: frames,
			init: function(){},
			update: function()
			{
				return (--timer > 0);
			}
		});
	},
	
	Play: function(cut)
	{
		cut._ready = true;
	},
	
	Dialogue: function(cut, text, voice = sndTextDefault, pitch = [0.8, 1.2])
	{
		self.Custom(cut, {
			tx: text,
			v: voice,
			pit: pitch,
			dia: -1,
			diaInst: noone,
			init: function(){
				self.dia = dialogueStart(self.tx, self.v, self.pit)
				self.diaInst = self.dia.GetTyper();
			},
			update: function()
			{
				return (instance_exists(self.diaInst));
			}
		});
	},
	
	Pause: function(cut)
	{
		Cutscene.Custom(cut, {
			cutsceneObj: cut,
			init: function()
			{
				cutsceneObj._ready = false;
			},
			update: false
		});
	},
	
	Stop: function(cut)
	{
		Cutscene.Custom(cut, {
			_cut: cut,
			init: function()
			{
				instance_destroy(_cut);
			},
			update: false
		});
	}
};