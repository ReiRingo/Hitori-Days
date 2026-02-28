depth = -1000;

if (_debug)
{
	drawReset();
	draw_set_font(GuiFont);
	draw_set_colour(c_grey);
	drawTextGUI([ 10, 10 ], $"{room_get_name(room)}");
}

draw_set_font(GuiFont);
drawReset();