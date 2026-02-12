// -- Main config
text = ["This is [wave][c_red]OBVIOUSLY[/c][/wave] a placeholder..."];
voice = [{ v : -1, p : [1, 1] }];
autoPos = true; // Automatic x and y of GUI
toWorld = false;
panel = sprPanelGUI;
panelVariation = 0;
skippable = true;
speaker = "PlaceHolderGuy"; // Use strings
typerSpeed = 0.5;

// -- Technical Config
depth = min(room_height - 800, -10000);
_ready = false;
_animating = true;
_panelY = 0;
_panelH = 0;
_typing = false;

// -- Pages
_pageIndex = 0;

// -- Scribble
_scrib = scribble("");
_typist = scribble_typist();

var _start = function() { event_user(1); };
call_later(1, time_source_units_frames, _start);