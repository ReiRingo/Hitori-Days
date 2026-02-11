var _inDepth;

if (instance_exists(objTable))
	with (objTable)
	{
		_inDepth = depth - 10;
	}
else
{
	_inDepth = Depth.World - y;
}

depth = _inDepth;