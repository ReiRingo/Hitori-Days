#macro Interp global.__interp
#macro SettingsInterp "interp"
Interp = Save.Get(SType.Settings, SettingsInterp, true);

#macro GuiFont global.__guiFont
GuiFont = fontDefaultBlur;

#macro LangChoices global.__langChoices
#macro SettingsLang "lang"
LangChoices = [];