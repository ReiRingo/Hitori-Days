audio_stop_all();
audio_play_sound(musShi1, 1, true);

options = [
	// M IS DEPRECATED!
    { 
        n: Lang.get("settings_lang"), 
        m: "lang", 
        v: CurLang
    }, 
    { 
        n: Lang.get("settings_linear_interp"), 
        m: SettingsInterp, 
        v: $"<{Interp ? "ON" : "OFF"}>"
    },
	
    { n: Lang.get("settings_exit"), v: "" }
];

index = 0;

langIndex = 0;
for (var i = 0; i < array_length(LangChoices); ++i)
{
	if (CurLang == LangChoices[i])
	{
		langIndex = i
		break;
	}
}

_prop = call_later(
	10,
	time_source_units_frames,
	function() {
		instance_create_depth(irandom(room_width), -5, depth, propConfetti);
	},
	true
);