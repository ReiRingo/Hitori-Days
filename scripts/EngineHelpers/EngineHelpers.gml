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
	draw_set_font(GuiFont);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
}

function drawPick(x, y, scale = 0.8, flip = false, col = c_white, alpha = 1)
{
	draw_sprite_ext(
		sprPointerGUI,
		0,
		x, y,
		(flip) ? -scale : scale, scale,
		0, col,
		alpha
	);
}

function drawTextGUI(pos, text, scale = 3, hAl = draw_get_halign(), vAl = draw_get_valign()) {
	var xOffset = 0.25, ogPixel = 16, newPixel = font_get_size(draw_get_font());
	var fontCorrection = ogPixel / newPixel;
	
	var _sc = is_array(scale) ? scale : [ scale, scale ];
	
	draw_set_halign(hAl);
	draw_set_valign(vAl);
	draw_text_ext_transformed(pos[0], pos[1], text, 30, -1, xOffset + (_sc[0] * fontCorrection), _sc[1] * fontCorrection, 0);
}

// WRITTEN by a good friend of mine
function worldToGui(_x, _y) {
    var _cam = view_camera[0];
    
    var _gui_x = (_x - camera_get_view_x(_cam)) * (display_get_gui_width() / camera_get_view_width(_cam));
    var _gui_y = (_y - camera_get_view_y(_cam)) * (display_get_gui_height() / camera_get_view_height(_cam));
    
    return { x: _gui_x, y: _gui_y }; // Made it vector-ish
}

function drawPanel(x, y, w, h, panelIndex = 0, panel = sprPanelGUI)
{
	draw_sprite_stretched(panel, panelIndex, x, y, w, h);
}

function objectGetBase(_obj)
{
	while (object_exists(object_get_parent(_obj)))
	{
		_obj = object_get_parent(_obj);
	}
	
	return _obj;
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

function drawTextOutline(_x, _y, _text, _outlineSpace = 1, _outlineColour = c_black)
{
    var _textCol = draw_get_colour();
    
    draw_set_colour(_outlineColour);
    
    for (var i = 0; i < 360; i += 45) 
    {
        draw_text(
            _x + lengthdir_x(_outlineSpace, i), 
            _y + lengthdir_y(_outlineSpace, i), 
            _text
        );
    }
    
    draw_set_colour(_textCol);
    draw_text(_x, _y, _text);
}