/// DRAW GUI EVENT

if (currentSong == undefined) exit;

var _guiW = display_get_gui_width();
var _guiH = display_get_gui_height();

// 1. DRAW BACKGROUND FRAME
// Using your 9-slice sprite to make a cool DAW background
// Let's assume a margin of 10 pixels
draw_set_colour(c_black);
// draw_sprite_stretched(sprStretchy, 0, 5, 5, _guiW - 10, _guiH - 10);

// 2. DEFINE DRAW ORIGIN (Inside the frame)
var _gridOriginX = 20;
var _gridOriginY = 40; // Leave space for Header Text

// 3. DRAW HEADER INFO
var _headerText = $"SONG: {currentSong.name} | BPM: {currentSong.bpm}";
drawTextGUI([_gridOriginX, 10], _headerText); // Using your custom function

for (var i = 0; i < GRID_W; i++)
{
    var _dataIndex = viewX + i;
    var _drawX = _gridOriginX + (i * CELL_W);
    
    // Check if we are inside the song's current bounds
    var _isInBounds = (_dataIndex < currentSong.GetSize());
    var _slotData = _isInBounds ? currentSong.grid[_dataIndex] : undefined;
    
    // -- Draw Bar Lines (Visual Aid) --
    // If it's the start of a bar (based on TimeSig), draw a darker line
    if (_dataIndex % currentSong.timeSig == 0) {
        draw_set_color(c_dkgray);
        draw_line(_drawX, _gridOriginY, _drawX, _gridOriginY + (GRID_H * CELL_H));
    }

    // -- Draw Notes --
    if (_isInBounds && _slotData != undefined && _slotData.active)
    {
        // Calculate Y based on pitch. 
        // Logic: Higher pitch = Higher on screen (Smaller Y)
        // We use log2 to reverse the pitch math: pitch 2.0 -> 1 octave -> 12 blocks
        var _pitchOffset = (log2(_slotData.pitch) * 12); 
        var _noteRow = 12 + _pitchOffset; // 12 is our "Middle C" visual offset
        
        // Invert Y so high notes are up: (TotalRows - NoteRow)
        var _drawY = _gridOriginY + ((GRID_H - _noteRow) * CELL_H);
        
        draw_set_color(c_aqua); // Neon retro color
        draw_rectangle(_drawX + 1, _drawY + 1, _drawX + CELL_W - 2, _drawY + CELL_H - 2, false);
    }
}

// 5. DRAW CURSOR (Only in Editing Mode)
if (state == DawState.Editing)
{
    // Calculate visual position relative to View
    var _visCursorX = cursorX - viewX;
    
    // Only draw if cursor is on screen
    if (_visCursorX >= 0 && _visCursorX < GRID_W)
    {
        var _cx = _gridOriginX + (_visCursorX * CELL_W);
        var _cy = _gridOriginY + ((GRID_H - cursorY) * CELL_H); // Inverted Y logic
        
        draw_set_color(c_white);
        draw_rectangle(_cx, _cy, _cx + CELL_W, _cy + CELL_H, true);
    }
}

// 6. DRAW PLAYHEAD
if (isPlaying)
{
    var _visPlayhead = playhead - viewX;
    if (_visPlayhead >= 0 && _visPlayhead < GRID_W)
    {
        var _phX = _gridOriginX + (_visPlayhead * CELL_W);
        draw_set_color(c_red);
        draw_line_width(_phX, _gridOriginY, _phX, _gridOriginY + (GRID_H * CELL_H), 2);
    }
    
    // Auto-scroll follow
    if (playhead > viewX + GRID_W - 2) viewX = floor(playhead) - 2;
}

// 7. DRAW MENU OVERLAY
if (state == DawState.Menu)
{
    // Draw a smaller box in the center
    var _mx = _guiW / 2 - 50;
    var _my = _guiH / 2 - 40;
    
	draw_set_colour(c_white);
    draw_sprite_stretched(sprStretchy, 1, _mx, _my, 100, 80 + 10); // Sub-image 1 for "Menu" style?
    
    for (var m = 0; m < array_length(menuOptions); m++)
    {
        var _str = (m == menuIndex) ? $"> {menuOptions[m]} <" : menuOptions[m];
        var _col = (m == menuIndex) ? c_yellow : c_ltgray;
        
        // Use standard draw for menu or your custom function if it supports color
        draw_set_color(_col);
        draw_text(_mx + 10, _my + 10 + (m * 15), _str); 
    }
}