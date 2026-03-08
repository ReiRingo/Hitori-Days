draw_set_font(GuiFont);

var _gui = {
	w: display_get_gui_width(),
	h: display_get_gui_height()
};

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

var _margin = 30;
var _space = 55;

var _proc = 0;
var _size = array_length(options);
repeat(_size) {
	var isSelected = (_proc == index);
	var scale = isSelected ? 3.3 : 3.0;
	var colour = isSelected ? c_white : c_grey;
	
	// Options
	draw_set_colour(colour);
	drawTextGui([_margin, _margin + (_space * _proc)], options[_proc].n, scale);
	drawTextGui([display_get_gui_width() / 1.5 - _margin, _margin + (_space * _proc)], options[_proc].v, scale);
	
	// Pointer
	draw_set_colour(c_white);
	if (_proc == index)
		drawPick(display_get_gui_width() - (_margin * 1.5), _margin + (_space * pickLerp) + 22, , true);
	
	// Increment
	++_proc;
}

// -- Tutorial-ish again
draw_set_colour(c_grey);
draw_set_halign(fa_right);
draw_set_valign(fa_bottom);
drawTextGui([_gui.w - 30, _gui.h - 30], Lang.get("menu_hint_controls_pc"), 1.5);

// -- Reset
drawReset();
