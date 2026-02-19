var _flag = Save.get(SType.Cutscenes, "intro", false);

if (!_flag)
{
	var _c = Cutscene.create();
	
	Cutscene.playerMoveable(_c, false);
	Cutscene.sleep(_c, 30);
	Cutscene.charMoveTarget(_c, charPlayer, 144, charPlayer.y);
	Cutscene.sleep(_c, 15);
	Cutscene.charMoveTarget(_c, charPlayer, 144, 144);
	Cutscene.startDialogue(_c, Lang.get("cutscene_intro_michiyo"));
	// TODO: door sound effect!
	Cutscene.sleep(_c, 30); // One second
	Cutscene.startDialogue(_c, Lang.get("cutscene_intro_bocchi1"));
	Cutscene.action(_c, function() { camShaker(10, 4); });
	Cutscene.startDialogue(_c, Lang.get("cutscene_intro_bocchi2"));
	Cutscene.playerMoveable(_c, true);
	
	Cutscene.play(_c);
	
	Save.set(SType.Cutscenes, "intro", true);
}

// 144