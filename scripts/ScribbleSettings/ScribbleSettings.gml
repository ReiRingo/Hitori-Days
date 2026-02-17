scribble_font_set_default(font_get_name(fontDefaultBlur));

call_later(
	1,
	time_source_units_frames,
	function()
	{
		scribble_font_set_default(font_get_name(GuiFont));
	}
);