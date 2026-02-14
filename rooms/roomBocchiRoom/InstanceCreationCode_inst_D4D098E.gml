var _flag = Save.Get(SType.Cutscenes, "intro", false);

if (!_flag)
{
	var _c = Cutscene.Create();
	
	Cutscene.PlayerMoveable(_c, false);
	Cutscene.Wait(_c, 30);
	Cutscene.MoveCharTarget(_c, charPlayer, 144, charPlayer.y);
	Cutscene.Wait(_c, 15);
	Cutscene.MoveCharTarget(_c, charPlayer, 144, 144);
	Cutscene.Dialogue(_c, [
		"Hitori!",
		"Dear!",
		"We'll be going now,\nI hope you have fun alone!",
		"(Which you probably will...)",
		"Anywho, byebye![delay,70] Love you!"
	]);
	Cutscene.PlayerMoveable(_c, true);
	
	Cutscene.Play(_c);
	
	Save.Set(SType.Cutscenes, "intro", true);
}

// 144