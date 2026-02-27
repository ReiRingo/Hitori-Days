#macro CRT global.__interp
#macro SettingsCrt "interp"
CRT = Save.get(SType.Settings, SettingsCrt, true);

#macro GuiFont global.__guiFont
GuiFont = fontDefaultBlur;

#macro LangChoices global.__langChoices
#macro SettingsLang "lang"
LangChoices = [];