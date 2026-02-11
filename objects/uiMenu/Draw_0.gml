// -- option
var _len = array_length(_options);
var _space = 15;

draw_set_halign(fa_left);
draw_set_valign(fa_middle);

for (var i = 0; i < _len; ++i)
{
	draw_text(20, 20 + (i * _space), _options[i]);
	
	if (_index == i)
		drawPick(150, 20 + (i * _space), 1, true);
}

drawReset();