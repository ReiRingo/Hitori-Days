_index = 0;

_options = [
	"New Game",
	"Continue Game",
	"Quit"
];

_sound = audio_play_sound(
	musMenu, 1, true
);

_locked = false;
_state = 0;

_trRoom = -1;
_startRoom = roomBocchiRoom;