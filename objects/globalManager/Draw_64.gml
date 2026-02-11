if (_debug)
{
	drawReset();
	draw_set_font(fontDefaultBlur);
	draw_set_colour(c_grey);
	drawTextGUI([ 10, 10 ], $"{room_get_name(room)}");
}

draw_set_font(fontDefault);
drawReset();