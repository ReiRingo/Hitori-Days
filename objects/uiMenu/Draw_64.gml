var guiW = display_get_gui_width();
var guiH = display_get_gui_height();
draw_set_font(GuiFont);

if (_state == 0) 
{
	var count = array_length(_options);
	var spacing = 90.0;
	var startY = guiH * 0.35;
	startY += 30;
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	for (var i = 0; i < count; ++i)
	{
		var isSelected = (_index == i);
		var col = c_white;
		draw_set_color(col);
		drawTextGui([guiW / 2, startY + (i * spacing)], _options[i], 3.2);
		
		if (isSelected && !_locked && fader._alpha == 0 && (timer % 30 < 15)) 
		{
			drawPick((guiW / 4) + 40, startY + (i * spacing));
		}
	}
} 
else if (_state == 1) 
{
	var slotH = 140;
	var marginX = 100;
	var startY = 120;
	
	for (var i = 0; i < _loadSize; ++i) 
	{
		var isSelected = (_loadIndex == i);
		var slotY = startY + (i * (slotH + 20));
		draw_set_alpha(isSelected ? 1.0 : 0.7);
		drawPanel(marginX, slotY, guiW - (marginX * 2), slotH);
		
		var ld = _load[i];
		var roomNamer = Player.MapName;
		var infoText = (ld.available) 
			? $"{roomNamer(ld.room)}\n{Lang.get("menu_load_time")}: {timeFormatter(ld.time)}\n{Lang.get("menu_load_money")}: {ld.money} Yen" 
			: "--- " + Lang.get("menu_empty_slot") + " ---";
		
		draw_set_alpha(1);
		drawTextGui([marginX + 30, slotY + (slotH / 2)], infoText, 1.4, fa_left, fa_middle);
		
		if (isSelected && (timer % 20 < 10))
		{
			draw_set_color(c_white);
			draw_rectangle(marginX - 5, slotY - 5, guiW - marginX + 5, slotY + slotH + 5, true);
		}
	}
	drawTextGui([guiW / 2, 40], Lang.get("menu_hint_load"), 2, fa_center, fa_top);
}
var hintScale = 1.2

draw_set_colour(c_white);

if (_state != 1) drawTextGui([30, guiH - 30], Lang.get("menu_hint_controls_pc"), hintScale, fa_left, fa_bottom);
if (_state != 1) drawTextGui([guiW - 30, guiH - 30], Lang.get("menu_hint_creator"), 1.2, fa_right, fa_bottom);

drawReset();