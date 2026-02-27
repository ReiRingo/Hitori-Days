_index = 0;

_options = [
	Lang.get("menu_ng"),
	Lang.get("menu_lg"),
	Lang.get("menu_st"),
	Lang.get("menu_qt")
];

if (audio_is_playing(musMenu))
	audio_stop_sound(musMenu);
_sound = audio_play_sound(
	musMenu, 1, true
);

_locked = false;
_state = 0;

_trRoom = -1;
_startRoom = roomBocchiRoom;

_loadIndex = 0; // < Cursor
_load = [];
_loadSize = 3;
_ready = false;

var _proc = 0;
repeat(_loadSize)
{
	Save.setSlot(_proc);
	if (Player.LoadGame(1))
	{
		_load[_proc] = {
			available: true,
			room: Save.get(SType.Snapshot, SSnapshot.Room, roomBocchiRoom),
			time: Save.get(SType.Snapshot, SSnapshot.Time, 0),
			money: Save.get(SType.Snapshot, SSnapshot.Yen, 0)
		};
	}
	else
	{
		_load[_proc] = {
			available: false,
			room: -1,
			time: -1,
			money: -1
		};
	}
	_proc++;
}
Save.setSlot(0);

event_user(0);

// Wave
timer = 0;