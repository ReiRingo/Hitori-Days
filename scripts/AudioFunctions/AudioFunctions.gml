global.__Audio = {};

function __audLib() constructor
{
	static IndexedAudio = undefined;
	
	static Play = function(audioId, audio, loop = true, priority = 1, gain = 1, pitch = 1, offset = undefined)
	{
		if (!audio_exists(audio) || audio_is_playing(audio))
			return;
		
		global.__Audio[$ audioId] = audio_play_sound(audio, priority, loop, gain, offset, pitch);
		
		return global.__Audio[$ audioId] ?? undefined;
	}
	
	static Stop = function(audioId, fadeTime = 0)
	{
		IndexedAudio = global.__Audio[$ audioId] ?? undefined;
		
		if (audio_exists(IndexedAudio) && audio_is_playing(IndexedAudio))
		{
			if (fadeTime >= 1)
			{
				audio_sound_gain(_a, 0, fadeTime);
				call_later(fadeTime, time_source_units_frames, function()
				{
					audio_stop_sound(IndexedAudio);
					audio_sound_gain(IndexedAudio, 1);
					audio_sound_pitch(IndexedAudio, 1);
				});
			}
			else
			{
				audio_stop_sound(IndexedAudio);
				audio_sound_gain(IndexedAudio, 1);
				audio_sound_pitch(IndexedAudio, 1);
			}
			return true;
		}
		return false;
	}
	
	static Pitch = function(audioId, pitch, time = 0)
	{
		IndexedAudio = global.__Audio[$ audioId] ?? undefined;
		
		if (audio_exists(IndexedAudio) && audio_is_playing(IndexedAudio))
		{
			if (time >= 1)
			{
				doAnime(audio_sound_get_pitch(IndexedAudio), pitch, time, "linear", function(n)
				{
					audio_sound_pitch(IndexedAudio, n);
				});
			}
			else
			{
				audio_sound_pitch(IndexedAudio, pitch);
			}
			return true;
		}
		return false;
	}
	
	static Gain = function(audioId, gain, time)
	{
		IndexedAudio = global.__Audio[$ audioId] ?? undefined;
		
		if (audio_exists(IndexedAudio) && audio_is_playing(IndexedAudio))
		{
			if (time >= 1)
			{
				doAnime(audio_sound_get_gain(IndexedAudio), gain, time, "linear", function(n)
				{
					audio_sound_gain(IndexedAudio, n);
				});
			}
			else
			{
				audio_sound_gain(IndexedAudio, gain);
			}
			return true;
		}
		return false;
	}
}

#macro Bgm global.__audioLib

Bgm = new __audLib();