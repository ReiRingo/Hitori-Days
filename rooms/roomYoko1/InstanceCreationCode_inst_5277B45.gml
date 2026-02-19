event = function()
{
	var _fName = "rip_bocchi_socialise_jumpscare"
	var _flag = Save.get(SType.Cutscenes, _fName, false);
	
	if (!_flag)
	{
		dialogueStart(Lang.get("dialogue_helper_talk"));
		Save.set(SType.Cutscenes, _fName, true);
	}
	else
	{
		dialogueStart(Lang.get("dialogue_helper_save_hint"));
	}
}