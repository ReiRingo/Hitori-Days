#macro GameStates global.__svSt

function __GameStatesInit(includeSnapshot = false)
{
	GameStates = {
		rm: roomBocchiRoom,
		time: 0,
		yen: 0
	};
	
	if (includeSnapshot)
	{
		Save.Set(SType.Snapshot, SSnapshot.Room, GameStates.rm);
		Save.Set(SType.Snapshot, SSnapshot.Time, 0);
		Save.Set(SType.Snapshot, SSnapshot.Yen, 0);
	}
}

__GameStatesInit();