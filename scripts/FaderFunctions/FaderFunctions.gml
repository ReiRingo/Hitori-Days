function faderFade(val, newVal, time, colour = fader._colour)
{
	if (time <= 0)
	{
		fader._alpha = newVal;
		fader._colour = colour;
	}
	else
	{
		doAnime(val, newVal, time, "linear", function(a)
		{
			fader._alpha = a;
		});
		
		fader._colour = colour;
	}
}