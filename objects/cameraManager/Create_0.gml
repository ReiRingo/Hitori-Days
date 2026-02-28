application_surface_draw_enable(false);

// -- Reset
event_user(0);

// -- Window
window_set_size(_port.x, _port.y);
call_later(
	1,
	time_source_units_frames,
	function()
	{
		window_center();
	}
);

// NTSC Blargg Config
ntsc = shaderNTSC;
ntscResolution = shader_get_uniform(ntsc, "resolution");	// vector2 (floats)
ntscTime = shader_get_uniform(ntsc, "time");
ntscNoise = shader_get_uniform(ntsc, "noiseAngle");
ntscNoiseI = shader_get_uniform(ntsc, "noiseIntensity");

ntscNoiseIValue = 0.7;
ntscNoiseValue = 0;

ntscTimer = 0;

// Initial
guiSurface = -1;

// Window Blur
Window.ApplyBlur(window_handle());