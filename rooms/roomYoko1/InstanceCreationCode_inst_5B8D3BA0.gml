event = function()
{
	var _f = Save.Get(SType.Cutscenes, "money_help", false);
	
	if (!_f)
		dialogueStart(Lang.Get("dialogue_helper_balance1"));
	else
		dialogueStart(Lang.Get("dialogue_helper_balance2"));
};