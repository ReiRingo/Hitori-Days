function print(strOrVal)
{
	var _out = string(strOrVal);
	
	for (var i = 1; i < argument_count; ++i)
	{
		_out += string(argument[i]);
	}
	
	show_debug_message(_out);
}

function drawReset()
{
	draw_set_alpha(1);
	draw_set_colour(c_white);
	draw_set_font(fontDefault);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

function drawPick(x, y, scale = 1, flip = false, col = c_white, alpha = 1)
{
	draw_sprite_ext(
		sprPointer,
		0,
		x, y,
		(flip) ? -scale : scale, scale,
		0, col,
		alpha
	);
}

function drawTextGUI(pos, text, scale = 3, hAl = draw_get_halign(), vAl = draw_get_valign())
{
	var _sc;
	if (is_array(scale))
	{
		_sc = scale;
	}
	else
	{
		_sc = [ scale, scale ];
	}
	
	draw_set_halign(hAl);
	draw_set_valign(vAl);
	draw_text_ext_transformed(pos[0], pos[1], text, -1, -1, _sc[0], _sc[1], 0);
}

function drawPanel(x, y, w, h, panelIndex = 0, panel = sprPanel)
{
	draw_sprite_stretched(panel, panelIndex, x, y, w, h);
}

function bpmBarFrame(bpm, bar = 1, beats_per_bar = 4, fps = 30)
{
	var _frames = (60 / bpm) * beats_per_bar * fps * bar;
	
	return round(_frames);
}

function mapValue(input, inputArr, outputArr)
{
	var _inMin  = inputArr[0];
	var _inMax  = inputArr[1];
	var _outMin = outputArr[0];
	var _outMax = outputArr[1];
	
	return _outMin + (input - _inMin) * (_outMax - _outMin) / (_inMax - _inMin);
}