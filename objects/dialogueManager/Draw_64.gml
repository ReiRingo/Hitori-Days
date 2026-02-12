var _gui = {
	x : display_get_gui_width(),
	y : display_get_gui_height()
};

var _drawX = _gui.x / 2;

if (_ready)
{
	var _marginX = 40;
	if (sprite_exists(panel))
	{
		drawPanel(_marginX, _panelY, (_drawX * 2) - (_marginX * 2), _panelH, panelVariation, panel);
	}
	
	if (!_animating)
	{
		if (autoPos)
		{
			_scrib.draw(_marginX + 20, _panelY + 20, _typist);
		}
		else
		{
			var _pos = worldToGui(x, y); // < Written by a good
			// friend of mine :>
			if (toWorld)
				_scrib.draw(_pos.x, _pos.y, _typist);
			// He didn't want to be credited though...
			// Hello github!
			else
				_scrib.draw(x, y, _typist);
		}
	}
}