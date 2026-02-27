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

// Horrifi config
horrifi_bloom_set(false,26.56,0.30,0.72);
horrifi_chromaticab_set(true,0.07);
horrifi_scanlines_set(true,0.09);
horrifi_vhs_set(false,0.19);
horrifi_vignette_set(true,0.13,0.66);
horrifi_crt_set(false,3.88);
horrifi_noise_set(true,0.08);

// Initial
guiSurface = -1;