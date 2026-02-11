///Reset
image_alpha = 0;

doAnime(
	0, 1, 30, "linear",
	function(a)
	{
		image_alpha = a;
	}
);

// -- Start Timer
_timer = 0;
_ready = false;
_resetting = false;