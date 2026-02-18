var _gui = {
		w : display_get_gui_width()
};

draw_set_font(GuiFont);

var _topPad = 40;
var _space = 180;
var _margin = 80;
var _info = "";
var _ld = _load[_saveIndex];
var _mapNamer = Player.MapName;

if (_isSave)
{
	var _proc = 0;
	repeat(_saveSize)
	{
		_ld = _load[_proc];
		_info = (_ld.available)
			?
			$"{_mapNamer(_ld.room)}\n{Lang.Get("menu_load_time")}: {timeFormatter(_ld.time)}\n{Lang.Get("menu_load_money")}: {_ld.money} Yen"
			:
			"---------";
		
		drawPanel(_margin * 2, _margin + (_proc * _space) + _topPad, _space * 3, _space - _margin);
		drawTextGUI([(_margin * 2) + 20, _margin + 20 + (_proc * _space) + _topPad], _info, 1);
		
		if (_proc == _saveIndex)
			drawPick(_margin, _margin + (_margin / 2) + 5 + (_proc * _space) + _topPad);
		
		_proc++;
	}
	
	drawPanel(_margin, 10, _gui.w - (_margin * 2), 100);
	drawTextGUI([_gui.w / 2, 18], Lang.Get("save_hint_save"), 3, fa_center, fa_top);
}

if (_saved)
{
	_ld = _load[_saveIndex];
	_info = $"{_mapNamer(_ld.room)}\n{Lang.Get("menu_load_time")}: {timeFormatter(_ld.time)}\n{Lang.Get("menu_load_money")}: {_ld.money} Yen";
	drawPanel(_margin * 2, _margin + (_saveIndex * _space) + _topPad, _space * 3, _space - _margin);
	drawTextGUI([(_margin * 2) + 20, _margin + 20 + (_saveIndex * _space) + _topPad], _info, 1);
	drawPanel(_margin, 10, _gui.w - (_margin * 2), 100);
	drawTextGUI([_gui.w / 2, 18], Lang.Get("save_hint_saved"), 3, fa_center, fa_top);
}

drawReset();