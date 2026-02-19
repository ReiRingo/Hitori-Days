function __glbStLib() constructor
{
	static getTime = function()
	{
		return GameStates.time;
	}
	
	static setTime = function(val)
	{
		GameStates.time = val;
	}
	
	static getYen = function()
	{
		return GameStates.yen;
	}
	
	static setYen = function(val)
	{
		GameStates.yen = val;
	}
	
	static GetRoom = function()
	{
		return GameStates.rm;
	}
	
	static SetRoom = function(val)
	{
		GameStates.rm = val;
	}
	
	static Reset = function(includeSnapshot = false)
	{
		__GameStatesInit(includeSnapshot);
	}
}

#macro States global.__stLib

States = new __glbStLib();