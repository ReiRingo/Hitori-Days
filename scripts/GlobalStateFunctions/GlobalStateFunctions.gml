function __glbStLib() constructor
{
	static GetTime = function()
	{
		return GameStates.time;
	}
	
	static SetTime = function(val)
	{
		GameStates.time = val;
	}
	
	static GetYen = function()
	{
		return GameStates.yen;
	}
	
	static SetYen = function(val)
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