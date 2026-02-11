#macro Window global.cppWindowLib

Window =
{
	///@param {pointer} Handle
	ApplyBlur: function(n)
	{
		if (!is_ptr(n))
			return false;
		
		__HandlerBlur(n);
		return true;
	}
};