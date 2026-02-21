#macro Cutscene global.cutFuncLib

Cutscene = {
	create: function() {
		return instance_create_depth(0, 0, 0, cutsceneManager);
	},
	
	custom: function(cut, struct) {
		array_push(cut._queue, struct);
	},
	
	action: function(cut, func)
	{
		self.custom(cut, {
			init: func,
			update: false
		});
	},
	
	playerMoveable: function(cut, moveable)
	{
		self.custom(cut, {
			moveBool: moveable,
			init: function()
			{
				if (instance_exists(charPlayer))
					charPlayer._canMoveCutscene = moveBool;
			},
			update: false
		});
	},
	
	charMove: function(cut, targetChar, directionState, amount, wait = true)
	{
		self.custom(cut, {
			_character: targetChar,
			wait: wait,
			dir: directionState,
			amt: amount,
			init: function() {
				_character._move[dir] = amt;
			},
			update: function()
			{
				if (!wait)
					return false;
				return (_character._move[dir] != 0);
			}
		});
	},
	
	charMoveTarget: function(cut, chars, tx, ty, wait = true)
	{
		self.custom(
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
	
	charTurn : function(_cut, _char, _dir) {
		self.custom(_cut, {
			ch: _char,
			ready: false,
			dir: _dir,
			init: function() {
				self.ready = true;
			},
			update: function() {
				if (!self.ready)
					return true;
				self.ch.dir = self.dir;
				return false;
			}
		});
	},
	
	sleep: function(cut, frames)
	{
		self.custom(cut, {
			timer: frames,
			init: function(){},
			update: function()
			{
				return (--timer > 0);
			}
		});
	},
	
	play: function(cut)
	{
		cut._ready = true;
	},
	
	startDialogue: function(cut, text, voice = sndTextDefault, pitch = [0.8, 1.2])
	{
		self.custom(cut, {
			tx: text,
			v: voice,
			pit: pitch,
			dia: -1,
			diaInst: noone,
			init: function(){
				self.dia = dialogueStart(self.tx, self.v, self.pit)
				self.diaInst = self.dia.getTyper();
			},
			update: function()
			{
				return (instance_exists(self.diaInst));
			}
		});
	},
	
	halt: function(cut)
	{
		self.custom(cut, {
			cutsceneObj: cut,
			init: function()
			{
				cutsceneObj._ready = false;
			},
			update: false
		});
	},
	
	endOnQueue: function(cut)
	{
		Cutscene.custom(cut, {
			_cut: cut,
			init: function()
			{
				instance_destroy(_cut);
			},
			update: false
		});
	}
};