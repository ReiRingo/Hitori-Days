var _cond = Save.Get(SType.Cutscenes, "guitar", false);

if (!_cond)
{
	event = function()
	{
		dialogueStart([
			"A Gibson guitar.",
			"Handed to you by your dad.",
			"Old but gold."
		]);
		
		event = function()
		{
			dialogueStart("[wave]Your soulmate guitar.[/wave]");
		};
	};
	
	Save.Set(SType.Cutscenes, "guitar", true);
}
else
{
	event = function()
	{
		dialogueStart("[wave]Your soulmate guitar.[/wave]");
	};
}