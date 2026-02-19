event = function()
{
	var _f = Save.get(SType.Cutscenes, "money_help", false);
	
	if (!_f)
		dialogueStart(Lang.get("dialogue_helper_balance1"));
	else
		dialogueStart(Lang.get("dialogue_helper_balance2"));
};