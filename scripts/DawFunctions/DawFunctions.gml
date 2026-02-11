function songLoadFromDisk()
{
	Save.LoadToDisk(SType.Songs);
}

function songSave(name, struct)
{
	Save.Set(SType.Songs, name, struct);
}

function songLoad(name)
{
	var _initial = Save.Get(SType.Songs, name);
	if (is_undefined(_initial))
		return false;
	
	return new SongClass("", 140, 4).LoadFromStruct(_initial);
}