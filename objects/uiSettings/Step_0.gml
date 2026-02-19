var _up = Input.Pressed(VKey.Up);
var _down = Input.Pressed(VKey.Down);
var _left = Input.Pressed(VKey.Left);
var _right = Input.Pressed(VKey.Right);

var _confirm = Input.Pressed(VKey.Confirm);

// -- Selection
var _prevIndex = index;
if (_down)
{
	index = (index >= array_length(options) - 1) ? 0 : index + 1;
}
else if (_up)
{
	index = (index <= 0) ? array_length(options) - 1 : index - 1;
}
if (index != _prevIndex)
	audio_play_sound(sndBlip, 1, false);

// -- Actions
switch(index)
{
	case 0:
		// LANGUAGE
		if (_right)
		{
			langIndex = (langIndex + 1) % array_length(LangChoices);
			CurLang = LangChoices[langIndex];
			print($"Settings: New language is {CurLang}");
			options[index].v = CurLang;
			event_user(0);
			SoundLib.Once(sndSelect);
		}
		else if (_left)
		{
			langIndex = (langIndex - 1 + array_length(LangChoices)) % array_length(LangChoices);
			CurLang = LangChoices[langIndex];
			print($"Settings: New language is {CurLang}");
			options[index].v = CurLang;
			event_user(0);
			SoundLib.Once(sndSelect);
		}
		break;
	
	case 1:
		// LINEAR INTERP
		if (_confirm)
		{
			Interp = !Interp;
			gpu_set_texfilter(Interp);
			options[index].v = $"<{Interp ? "ON" : "OFF"}>";
			SoundLib.Once(sndSelect);
		}
		break;
	
	case 2:
		// EXIT
		if (_confirm)
		{
			SoundLib.Once(sndSelect);
			Save.set(SType.Settings, SettingsLang, CurLang);
			Save.set(SType.Settings, SettingsInterp, Interp);
			Save.saveToDisk(SType.Settings);
			room_goto(roomMainMenu);
		}
		break;
}