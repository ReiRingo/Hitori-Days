var _flag = Save.Get(SType.Cutscenes, "intro", true);

if (!_flag)
{
	var _c = Cutscene.Create();
	
	Cutscene.PlayerMoveable(_c, false);
	Cutscene.Wait(_c, 200);
	Cutscene.PlayerMoveable(_c, true);
	
	Cutscene.Play(_c);
	
	Save.Set(SType.Cutscenes, "intro", true);
}