function __SoundFunctions() constructor
{
	static Once = function(snd)
	{
		if (!audio_exists(snd))
			return false;
		
		if (audio_is_playing(snd))
			audio_stop_sound(snd);
		audio_play_sound(snd, 1, false);
	}
}

#macro SoundLib global.__soundLib

SoundLib = new __SoundFunctions();