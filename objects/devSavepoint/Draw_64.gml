var guiW = display_get_gui_width();
var guiH = display_get_gui_height();

draw_set_font(GuiFont);

var headerH = 100;
var headerPad = 20;
var headerY = headerPad;

var listTop = headerY + headerH + 40; // Starts 40px below header
var listBottom = guiH - 40;          // Ends 40px from screen bottom
var availableHeight = listBottom - listTop;

var panelW = guiW * 0.8;
var panelH = 140;
var gutter = 20;
var totalListH = (panelH + gutter) * _saveSize;

var startY = listTop + (max(0, availableHeight - totalListH) / 2);

var textScale = 1.8;
var centerX = guiW / 2;
var mapNamer = Player.MapName;

var textXOffset = 30;
var textYOffset = 2;

// --- Background ---
if (_isSave || _saved) {
	var bgSpeed = 0.03;
    draw_sprite_tiled_ext(sprBGSave, 0, current_time * bgSpeed % 64, current_time * (bgSpeed * 2) % 64, 4, 4, c_white, 1);
}

// --- Draw Save Slots ---
if (_isSave) {
    for (var i = 0; i < _saveSize; ++i) {
        var ld = _load[i];
        var isSelected = (i == _saveIndex);
        var drawY = startY + (i * (panelH + gutter));
        
        // Panel Positioning
        var px = centerX - (panelW / 2);
        drawPanel(px, drawY, panelW, panelH, 1);
        
        // Data Formatting
        var info = "---------";
        if (ld.available) {
            info = $"{mapNamer(ld.room)}\n{Lang.get("menu_load_time")}: {timeFormatter(ld.time)}\n{Lang.get("menu_load_money")}: {ld.money} Yen";
        }
        
        // Text Placement
        var tx = px + textXOffset;
        var ty = drawY + (panelH / textYOffset);
        drawTextGUI([tx, ty], info, textScale, fa_left, fa_middle);
        
        // Selection Indicator
        if (isSelected) {
            drawPick(px - 40, drawY + (panelH / 2));
        }
    }
} else if (_saved) {
	var ld = _load[_saveIndex];
	var drawY = startY + ( _saveIndex * (panelH + gutter) );
	var px = centerX - (panelW / 2);
	draw_set_colour(c_yellow);
    drawPanel(px, drawY, panelW, panelH, 1);
	draw_set_colour(c_white);
	
	var info = "---------";
	if (ld.available) {
        info = $"{mapNamer(ld.room)}\n{Lang.get("menu_load_time")}: {timeFormatter(ld.time)}\n{Lang.get("menu_load_money")}: {ld.money} Yen";
    }
	
	var tx = px + textXOffset;
    var ty = drawY + (panelH / textYOffset);
    drawTextGUI([tx, ty], info, textScale, fa_left, fa_middle);
}

// --- Draw Header (Always on top) ---
if (_isSave || _saved) {
	var headerText = _saved ? Lang.get("save_hint_saved") : Lang.get("save_hint_save");
	drawPanel(guiW * 0.1, headerY, guiW * 0.8, headerH, 1);
	drawTextGUI([centerX, headerY + (headerH / 2)], headerText, 2, fa_center, fa_middle);
}

drawReset();