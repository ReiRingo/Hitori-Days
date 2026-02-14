// -- Control Bind

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
Lang.LoadLang("en", "en.json");
// TODO: Finish soon
/*
if (file_exists("langs.json"))
{
	var _buf = buffer_load("langs.json");
	var _str = buffer_read(_buf, buffer_text);
	buffer_delete(_buf);
	
	var _json = json_parse(_str);
	
	struct_foreach(_json, );
}
*/
#endregion

// Start
room_goto(roomLogo);