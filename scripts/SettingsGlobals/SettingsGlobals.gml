#macro Interp global.__interp
#macro SettingsInterp "interp"
Interp = Save.get(SType.Settings, SettingsInterp, true);

#macro GuiFont global.__guiFont
GuiFont = fontDefaultBlur;

#macro LangChoices global.__langChoices
#macro SettingsLang "lang"
LangChoices = [];