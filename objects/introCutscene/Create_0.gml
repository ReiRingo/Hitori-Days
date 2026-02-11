_count = bpmBarFrame(190, 0.25, 4, 30);
_proc = 0;
alarm[0] = _count * 2;
_started = false;
_music = -1;

_starting = false;
image_alpha = 0;

_offsetY = [ 0 - 40, room_height + 40 ];
_offsetYSin = 0;
_dancer = 0;

// Fuck it, my mind is fried
// Let's do this recursive lambda
// Java style
var _func = function()
{
	doAnime(_offsetY[0], 65, _count, "sine_out", function(a)
	{
		_offsetY[0] = a;
	});
	
	var _func2 = function()
	{
		doAnime(_offsetY[1], 85, _count, "sine_out", function(a)
		{
			_offsetY[1] = a;
		});
		
		call_later(
			_count + 5,
			time_source_units_frames,
			function()
			{
				faderFade(0, 1, _count - 5, c_white);
			}
		);
	};
	
	call_later(
		_count * 2,
		time_source_units_frames,
		_func2
	);
};

call_later(
	_count,
	time_source_units_frames,
	_func
);

_blackAlpha = 1;
_blackCol = c_black;

// I just snatched an old code of mine!
trail_history = [0, 0, 0, 0, 0, 0];
_heartbeat = 0;