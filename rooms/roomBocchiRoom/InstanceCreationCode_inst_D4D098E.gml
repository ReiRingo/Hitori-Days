var _flag = Save.Get(SType.Cutscenes, "intro", false);

if (!_flag)
{
	var _c = Cutscene.Create();
	
	Cutscene.PlayerMoveable(_c, false);
	Cutscene.Wait(_c, 30);
	Cutscene.MoveCharTarget(_c, charPlayer, 144, charPlayer.y);
	Cutscene.Wait(_c, 15);
	Cutscene.MoveCharTarget(_c, charPlayer, 144, 144);
	Cutscene.Dialogue(_c, Lang.Get("cutscene_intro_michiyo"));
	// TODO: door sound effect!
	Cutscene.Wait(_c, 30); // One second
	Cutscene.Dialogue(_c, Lang.Get("cutscene_intro_bocchi1"));
	Cutscene.Function(_c, function() { camShaker(10, 4); });
	Cutscene.Dialogue(_c, Lang.Get("cutscene_intro_bocchi2"));
	Cutscene.PlayerMoveable(_c, true);
	
	Cutscene.Play(_c);
	
	Save.Set(SType.Cutscenes, "intro", true);
}

// 144