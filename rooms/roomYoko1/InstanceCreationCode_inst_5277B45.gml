event = function()
{
	var _fName = "rip_bocchi_socialise_jumpscare"
	var _flag = Save.Get(SType.Cutscenes, _fName, false);
	
	if (!_flag)
	{
		dialogueStart(Lang.Get("dialogue_helper_talk"));
		Save.Set(SType.Cutscenes, _fName, true);
	}
	else
	{
		dialogueStart(Lang.Get("dialogue_helper_save_hint"));
	}
}