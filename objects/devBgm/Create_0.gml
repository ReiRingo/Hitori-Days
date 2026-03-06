// -- Technical Config
image_alpha = 0;
desf = function() { instance_destroy(id) };

// -- Config
bgmId = 0;
bgm = -1;
loop = true;
stop = false;
time = 0;
_bgmPtr = undefined; // Not really a pointer... but it's funny

// -- Action
call_later(1, time_source_units_frames, function(d = desf) {
	if (audio_exists(bgm)) {
		if (!stop) {
			_bgmPtr = Bgm.play(bgmId, bgm, loop);
		} else Bgm.stop(bgmId, time);
	}
	
	desf();
});
