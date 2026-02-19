Save.loadFromDisk(SType.Settings);

#region BUTTONS
// Confirm
Input.Bind(
	VKey.Confirm,
	[ord("Z"), vk_enter, vk_space]
);

// Cancel
Input.Bind(
	VKey.Cancel,
	[ord("X"), vk_shift]
);

// Arrow keys
Input.Bind(
	VKey.Up,
	[vk_up]
);
Input.Bind(
	VKey.Down,
	[vk_down]
);
Input.Bind(
	VKey.Right,
	[vk_right]
);
Input.Bind(
	VKey.Left,
	[vk_left]
);

// Misc:
Input.Bind(
	"res",
	[vk_f2]
);
#endregion

#region LANGS
_langInit = false;
_langSaved = Save.get(SType.Settings, SettingsLang, undefined);
_firstLang = {l: "en", f: false};
if (file_exists("langs.json"))
{
	var _buf = buffer_load("langs.json");
	var _str = buffer_read(_buf, buffer_text);
	buffer_delete(_buf);
	
	var _json = json_parse(_str);
	
	struct_foreach(_json, function(i, v)
	{
		static __jsonProc = 0;
		if (file_exists(v))
		{
			Lang.LoadLang(i, string(v));
			LangChoices[__jsonProc] = i;
			if (!_firstLang.f)
			{
				_firstLang.l = i;
				_firstLang.f = true;
			}
			
			if (!_langInit && !is_undefined(_langSaved) && i == _langSaved)
			{
				_langInit = true;
				CurLang = i;
			}
			print($"LANG PROC: {__jsonProc}");
			__jsonProc++;
		}
		else
			throw $"LANGUAGE ERROR: Language {i} with path {v} does not exist!";
	});
	
	if (CurLang == "nan")
	{
		_langInit = true;
		CurLang = _firstLang.l;
	}
}
else
{
	var _dir = "datafiles/";
	throw $"LANGUAGE ERROR: LANGUAGES (langs.json) NOT FOUND IN {_dir}!\nRedownload it back at https://github.com/ReiRingo/Hitori-Days";
}
#endregion

#region Exception Handler
if (file_exists(global.crashSprite))
{
	global.crash.spr = sprite_add(global.crashSprite, 0, true, true, 0, 0);
	global.crash.w = sprite_get_width(global.crash.spr);
	global.crash.h = sprite_get_height(global.crash.spr);
	sprite_delete(global.crash.spr);
}
#endregion

#region Settings
Interp = Save.get(SType.Settings, SettingsInterp, true);
gpu_set_texfilter(Interp);
#endregion

#region START
room_goto(roomLogo);
#endregion