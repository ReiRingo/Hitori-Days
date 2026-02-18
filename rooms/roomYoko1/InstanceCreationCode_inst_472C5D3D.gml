event = function()
{
	var _c = Cutscene.Create();
	
	Cutscene.Function(_c, function() { dialogueStart(Lang.Get("dialogue_trespass")); });
	Cutscene.PlayerMoveable(_c, false);
	Cutscene.MoveChar(_c, charPlayer, DirStates.Down, 5, true);
	Cutscene.Function(_c, function()
	{
		with(charPlayer)
			dir = DirStates.Up;
	});
	Cutscene.PlayerMoveable(_c, true);
	
	Cutscene.Play(_c);
}

_repeat = true;