#region -- Window-level stuff
function __winLib() constructor 
{
	static ApplyBlur = function(n)
	{
		if (!is_ptr(n))
			return false;
		
		// __HandlerBlur(n);
		return true;
	}
	
	static Crash = crashPrettifier;
	
	// static PrettyCrash = crash;
}

#macro Window global.__cppWindowLib
Window = new __winLib();
#endregion