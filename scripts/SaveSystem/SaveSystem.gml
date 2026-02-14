global.saves = {};
global.slotIndex = 0;

#macro Save global.saveFuncLib
Save =
{
	Set: function(type, save, value)
	{
		var _typeStr = string(type);
		if (!variable_struct_exists(global.saves, _typeStr))
		{
			global.saves[$ _typeStr] = {};
		}
		
		global.saves[$ _typeStr][$ string(save)] = value;
	},
	
	Get: function(type, save, def = undefined)
	{
		var _typeStr = string(type);
		var _ptr = global.saves[$ _typeStr];
		
		if (!is_struct(_ptr)) 
		{
			return def;
		}
		
		var _val = _ptr[$ string(save)];
		
		return _val ?? def;
	},
	
	SaveToDisk: function(type)
	{
		var _struct = global.saves[$ string(type)];
		if (!is_struct(_struct)) return;
		
		var _string = json_stringify(_struct, true);
		var _path = self.GetPath(type);
		var _dir = filename_dir(_path);
		
		if (!directory_exists(_dir))
			directory_create(_dir);
		
		var _buf = buffer_create(string_byte_length(_string), buffer_fixed, 1);
		buffer_write(_buf, buffer_text, _string); 
		buffer_save(_buf, _path);
		buffer_delete(_buf);
	},

	LoadToDisk: function(type)
	{
		var _path = self.GetPath(type);
		if (!file_exists(_path))
		{
			print($"File path {_path} does not exist!");
			return false;
		}
		
	    var _buf = buffer_load(_path);
		var _string = buffer_read(_buf, buffer_text); 
		buffer_delete(_buf);
		
		try
		{
			global.saves[$ string(type)] = json_parse(_string);
		}
		catch(_ex)
		{
			show_debug_message("JSON Load Error: " + string(_ex.message));
			return false;
		}
		return true;
	},
		
	GetPath: function(type)
	{
		var _path;
		var _defDir = working_directory;
		var _slot = $"Slot {self.GetSlot()}";
		var _slotDir = $"{_defDir}{_slot}/";
		
		switch(type)
		{
			default:
				_path = $"{_slotDir}{type}.savf";
				break;
			
			case SType.Snapshot:
				_path = $"{_slotDir}snapshot.savf";
				break;
			
			case SType.Cutscenes:
				_path = $"{_slotDir}cuts.savf";
				break;
			
			case SType.Settings:
				_path = $"{_defDir}/settings.savf";
				break;
		}
		
		return _path;
	},
	
	GetSlot: function()
	{
		return global.slotIndex;
	},
	
	SetSlot: function(ind)
	{
		global.slotIndex = abs(ind);
	},
	
	Clear: function(type)
	{
		global.saves[$ type] = {};
		return true;
	}
};
