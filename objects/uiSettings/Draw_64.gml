var _margin = 30;
var _space = 40;
draw_set_font(GuiFont);

var _gui = {
	w: display_get_gui_width(),
	h: display_get_gui_height()
};

var _proc = 0;
var _size = array_length(options);
repeat(_size)
{
	// Options
	drawTextGUI([_margin, _margin + (_space * _proc)], options[_proc].n);
	drawTextGUI([display_get_gui_width() / 2 - _margin, _margin + (_space * _proc)], options[_proc].v);
	
	// Pointer
	if (_proc == index)
		drawPick(display_get_gui_width() - (_margin * 1.5), _margin + (_space * _proc) + 22, , true);
	
	// Increment
	_proc++;
}

// -- Tutorial-ish again
draw_set_colour(c_grey);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
drawTextGUI([_gui.w - 30, _gui.h - 30], Lang.get("menu_hint_controls_pc"), 1.5);

// -- Reset
drawReset();