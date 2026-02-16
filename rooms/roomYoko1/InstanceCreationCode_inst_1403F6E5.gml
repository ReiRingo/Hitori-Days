event = function()
{
	var _c = Cutscene.Create();
	
	Cutscene.Function(_c, function() { dialogueStart(Lang.Get("dialogue_trespass")); });
	
	Cutscene.Play(_c);
}

_repeat = true;