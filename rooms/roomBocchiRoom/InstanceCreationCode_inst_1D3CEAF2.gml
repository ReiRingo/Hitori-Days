var _cond = Save.Get(SType.Cutscenes, "guitar", false);

print($"Cond: {_cond}");
if (!_cond)
{
	event = function()
	{
		dialogueStart(Lang.Get("dialogue_guitar1"));
		
		event = function()
		{
			dialogueStart(Lang.Get("dialogue_guitar2"));
		};
		
		Save.Set(SType.Cutscenes, "guitar", true);
	};
}
else
{
	event = function()
	{
		dialogueStart(Lang.Get("dialogue_guitar2"));
	};
}