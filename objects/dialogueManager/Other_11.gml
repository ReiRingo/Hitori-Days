/// Animation
var _iPanelY = display_get_gui_height() - 200;
var _iPanelH = 200 - 40;

var _speed = 9;
doAnime(_iPanelY + (_iPanelH / 2), _iPanelY, _speed, "sine_in", function(a)
{
	_panelY = a;
	if (_panelY > 0)
		_ready = true;
});
doAnime(0, _iPanelH, _speed, "sine_in", function(a)
{
	_panelH = a;
});

var _func = function()
{
	_animating = false;
};

call_later(_speed, time_source_units_frames, _func);