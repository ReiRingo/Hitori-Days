#region RESET
options = [
	// M IS DEPRECATED!
    { 
        n: Lang.get("settings_lang"), 
        m: "lang", 
        v: CurLang
    }, 
    { 
        n: Lang.get("settings_crt"), 
        m: SettingsCrt, 
        v: $"<{CRT ? "ON" : "OFF"}>"
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
#endregion