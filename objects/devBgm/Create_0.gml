// -- Technical Config
image_alpha = 0;

// -- Config
bgmId = 0;
bgm = -1;
loop = true;
stop = false;
time = 0;
_bgmPtr = undefined;

// -- Action
call_later(1, time_source_units_frames, function()
{
	if (audio_exists(bgm))
	{
		if (!stop)
			_bgmPtr = Bgm.Play(bgmId, bgm, loop);
		else
			Bgm.Stop(bgmId, time);
	}
});