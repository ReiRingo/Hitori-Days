///Count Off
if !(_proc > 3)
{
	// ONE TWO THREE FOUR!
	_proc++;
	audio_play_sound(sndTempHat, 1, false, 1, undefined, 1.038);
	alarm[0] = _count;
	doAnime(
		40, 0, _count, "linear",
		function(a)
		{
			_blackCol = make_colour_rgb(a, a, a);
		}
	);
}
else
{
	faderFade(1, 0, _count * 4, c_white);
	image_alpha = 1;
	_started = true;
	_music = audio_play_sound(musIntro, 1, false);
}