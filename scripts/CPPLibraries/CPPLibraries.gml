#macro Window global.cppWindowLib

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
}

Window = new __winLib();