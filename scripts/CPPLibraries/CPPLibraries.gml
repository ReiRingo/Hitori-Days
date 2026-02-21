#region -- Window-level stuff
function __winLib() constructor 
{
	static ApplyBlur = function(n)
	{
		if (!is_ptr)
			return false;
		
		__HandlerBlur(n);
		return true;
	}
	
	static Crash = function(text, width, height, sprite)
	{
		return crashPrettifier(text, width, height, sprite);
	}
	
	// static PrettyCrash = crash;
}

#macro Window global.__cppWindowLib
Window = new __winLib();
#endregion