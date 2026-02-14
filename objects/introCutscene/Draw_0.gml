drawReset();

var _drawTitle = function(sinAnim, alpha)
{
	// TITLE
	var _marg = 60;
	var _space = 20;
	
	draw_set_alpha(alpha);
	// HITORI!
	draw_sprite(sprIntroLetters, 0, _marg + 5, _offsetY[0] + sinAnim);
	draw_sprite(sprIntroLetters, 1, _marg + (1 * _space) + 5, _offsetY[0] + sinAnim);
	draw_sprite(sprIntroLetters, 2, _marg + (2 * _space), _offsetY[0] + sinAnim);
	draw_sprite(sprIntroLetters, 3, _marg + (3 * _space), _offsetY[0] + sinAnim);
	draw_sprite(sprIntroLetters, 4, _marg + (4 * _space), _offsetY[0] + sinAnim);
	draw_sprite(sprIntroLetters, 1, _marg + (5 * _space), _offsetY[0] + sinAnim);
	
	// DAYS!
	_marg = 85;
	draw_sprite(sprIntroLetters, 5, _marg + (0 * _space), _offsetY[1] + sinAnim);
	draw_sprite_ext(sprIntroGuitarPick, 0, _marg + (1 * _space), _offsetY[1] + sinAnim, 0.5, 0.5, 0, c_white, alpha);
	draw_sprite(sprIntroLetters, 6, _marg + (2 * _space), _offsetY[1] + sinAnim);
	draw_sprite(sprIntroLetters, 7, _marg + (3 * _space), _offsetY[1] + sinAnim);
}
// The title screen bg
draw_sprite_stretched_ext(sprBGTitle, 0, 0, 0, room_width, room_height, make_colour_rgb(14 + 30, 22 + 30, 78 + 30), 1);

// Black Cover
draw_sprite_stretched_ext(sprStretchy, 0, 0, 0, room_width, room_height, _blackCol, _blackAlpha);

// TITLE SHADOW
var _trail_length = 3; 
var _gap = 4;

for (var i = 1; i <= _trail_length; i++)
{
	var _history_pos = i * _gap;
	if (_history_pos < array_length(trail_history))
	{
		var _pastYSin = trail_history[_history_pos];
		var _alpha = max(0.4 - (i * 0.05) - 0.2, 0);
		_drawTitle(_pastYSin, _alpha);
	}
}

// TITLE
_drawTitle(_offsetYSin, 1.0);

// Bocchi dance
draw_self();

// Draw Text instead
// So it gets blurred
// And looks like it's part of the 1994
// Effect
if (_started)
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	draw_text_ext_transformed(room_width / 2, room_height - 10, Lang.Get("cr"), -1, -1, 0.5, 0.5, 0);
}


drawReset();