#region namespace Window:

function __winLib() constructor 
{
	static crash = showPrettyCrash;
	
	// static PrettyCrash = crash;
};

#macro Window global.__cppWindowLib
Window = new __winLib();

#endregion