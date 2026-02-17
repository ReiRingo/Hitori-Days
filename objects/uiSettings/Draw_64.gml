var _margin = 30;
var _space = 40;
draw_set_font(GuiFont);

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