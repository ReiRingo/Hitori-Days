function songLoadFromDisk()
{
	Save.loadFromDisk(SType.Songs);
}

function songSave(name, struct)
{
	Save.set(SType.Songs, name, struct);
}

function songLoad(name)
{
	var _initial = Save.get(SType.Songs, name);
	if (is_undefined(_initial))
		return false;
	
	return new SongClass("", 140, 4).LoadFromStruct(_initial);
}