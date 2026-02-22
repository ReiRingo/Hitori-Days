///@deprecated
function SongClass(_name, _bpm, _timeSig) constructor {
	self.name = string(_name);
	self.bpm = real(_bpm);
	self.timeSig = real(_timeSig);
	
	self.grid = [];
	
	static InsertSound = function(where, audio, pitch, oneIndex = true)
	{
		var _index = (oneIndex) ? where - 1 : where;
		var _currentLen = array_length(self.grid);
		
		if (_index >= _currentLen)
		{
			var _snap = self.timeSig; 
			var _newSize = floor((_index + _snap) / _snap) * _snap;
			
			for (var i = _currentLen; i < _newSize; i++)
			{
				self.grid[i] = {
					audio: noone,
					pitch: 1.0,
					active: false
				};
			}
		}
		
		var _slot = self.grid[_index];
		_slot.audio = audio;
		_slot.pitch = pitch;
		_slot.active = true;
	};

	static GetSize = function()
	{    return array_length(self.grid);    };
	
	static LoadFromStruct = function(_data)
	{
		self.name = _data.name;
		self.bpm = _data.bpm;
		self.grid = _data.grid;
		self.timeSig = _data.timeSig;
		return self;
	};
}