global.texts = {};
#macro CurLang global.lang
CurLang = "en";

function __jsLib() constructor
{
	static LoadLang = function(name, file)
	{
		var _buf = buffer_load(file);
		var _str = buffer_read(_buf, buffer_string);
		buffer_delete(_buf);
		
		global.texts[$ name] = json_parse(_str);
	}
	
	static ClearLang = function(name)
	{
		global.texts[$ name] = {};
	}
	
	static Get = function(index, name = CurLang, def = "")
	{
		var _lang = global.texts[$ name];
		if (!is_struct(_lang))
			return def;
		return _lang[$ index] ?? def;
	}
}

#macro Lang global.__lngLib

Lang = new __jsLib();