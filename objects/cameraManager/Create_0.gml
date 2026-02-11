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