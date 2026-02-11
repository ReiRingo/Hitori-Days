// THIS IS A CONCEPT
// Hello people looking at the source code!
// code!code_is_compiled

// --- State Machine ---
state = DawState.Editing;
menuIndex = 0;
menuOptions = ["Save Song", "Load Song", "Clear Grid", "Exit"];

// --- Navigation & View ---
cursorX = 0; // Time (Grid Index)
cursorY = 12; // Pitch (0 = Low, 12 = Mid, 24 = High)
viewX = 0;    // Horizontal scroll offset (in cells)
viewY = 0;    // Vertical scroll offset (in cells) -- Optional if you want vertical scrolling

// --- Visual Constants ---
CELL_W = 16;  // Width of one grid slot (adjust for your sprite size)
CELL_H = 12;  // Height of one pitch slot
GRID_W = 20;  // How many columns fit on screen
GRID_H = 24;  // How many rows fit on screen (2 octaves)

// --- Audio Engine ---
currentSong = undefined;
playhead = 0;
isPlaying = false;
playheadPixel = 0; // Visual smoother

// --- Helper Functions ---
startNewSong = function(_name, _bpm, _sig) {
    currentSong = new SongClass(_name, _bpm, _sig);
    playhead = 0;
    cursorX = 0;
};

loadSong = function(_name)
{
    var _loaded = songLoad(_name);
    if (_loaded != false) {
        currentSong = _loaded;
        playhead = 0;
    } else {
        show_debug_message("Failed to load song: " + _name);
    }
};

// Initialize a blank canvas immediately
startNewSong("Untitled", 120, 4);