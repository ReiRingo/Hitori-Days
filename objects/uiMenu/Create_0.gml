_index = 0;

_options = [
	Lang.Get("menu_ng"),
	Lang.Get("menu_lg"),
	Lang.Get("menu_st"),
	Lang.Get("menu_qt")
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
	Save.SetSlot(_proc);
	if (Player.LoadGame(1))
	{
		_load[_proc] = {
			available: true,
			room: Save.Get(SType.Snapshot, SSnapshot.Room, roomBocchiRoom),
			time: Save.Get(SType.Snapshot, SSnapshot.Time, 0),
			money: Save.Get(SType.Snapshot, SSnapshot.Yen, 0)
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
Save.SetSlot(0);

event_user(0);