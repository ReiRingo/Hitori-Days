event = function()
{
	var _c = Cutscene.create();
	
	Cutscene.action(_c, function() { dialogueStart(Lang.get("dialogue_trespass")); });
	Cutscene.playerMoveable(_c, false);
	Cutscene.charMove(_c, charPlayer, DirStates.Down, 5, true);
	Cutscene.action(_c, function()
	{
		with(charPlayer)
			dir = DirStates.Up;
	});
	Cutscene.playerMoveable(_c, true);
	
	Cutscene.play(_c);
}

_repeat = true;