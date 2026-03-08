var _cond = Save.get(SType.Cutscenes, "guitar", false);

if (!_cond)
{
	event = function()
	{
		dialogueStart(Lang.get("dialogue_guitar1"));
		
		event = function()
		{
			dialogueStart(Lang.get("dialogue_guitar2"));
		};
		
		Save.set(SType.Cutscenes, "guitar", true);
	};
}
else
{
	event = function()
	{
		dialogueStart(Lang.get("dialogue_guitar2"));
	};
}