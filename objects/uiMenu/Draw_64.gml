var _gui = {
		w : display_get_gui_width()
};

if (_state == 0)
{
	var _len = array_length(_options);
	var _space = 40;
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_middle);
	
	for (var i = 0; i < _len; ++i)
	{
		drawTextGUI([30, 50 + (i * _space)], _options[i]);
		
		if (_index == i && !_locked && fader._alpha == 0)
			drawPick(650, 50 + (i * _space), 1, true);
	}
}
else if (_state == 1)
{
	var _space = 150;
	var _margin = 80;
	
	var _proc = 0;
	repeat(_loadSize)
	{
		drawPanel(_margin, _margin + (_proc * _space) + 40, _space * 3, _space - 20);
		
		var _ld = _load[_proc];
		var _roomNamer = Player.MapName;
		var _name = (
			_ld.available
		) ? $"{_roomNamer(_ld.room)}\nTime: {timeToFrame(_ld.time)}\nMoney: {_ld.money} Yen" : "---------";
		
		drawTextGUI([_margin + 20, _margin + 20 + (_proc * _space) + 40], _name, 1.5);
		
		// DEBUGING
		//drawTextGUI([_margin, _margin + (_proc * _space)], $"{_proc} :: {_ld.available}");
		
		if (_loadIndex == _proc && !_locked && fader._alpha == 0)
			drawPick(600, _margin + (_margin / 2) + (_proc * _space) + 40, 1, true);
		
		_proc++;
	}
	drawTextGUI([_gui.w / 2, 18], "Where Do You Wanna Load?", 3, fa_center, fa_top);
}

drawReset();