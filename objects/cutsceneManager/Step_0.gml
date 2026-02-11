if (_ready)
{
	var _len = array_length(_queue);
	
	if (_index > _len - 1)
	{
		instance_destroy();
		exit;
	}
	
	try 
	{
		var _isFinished = false;
		
		if (_index > array_length(_queueInit) - 1)
		{
			array_push(_queueInit, false);
		}
		else
		{
			_queueInit[_index] ??= false;
		}
		
		if (!_queueInit[_index])
		{
			_queue[_index].init();
			_queueInit[_index] = true;
		}
		
		// If update is true, keep updating
		// If false, signal finish!
		if (is_method(_queue[_index].update))
		{
			_isFinished = (!_queue[_index].update());
		}
		else
		{
			_isFinished = (_queue[_index].update == false);
		}
		
		if (_isFinished)
			_index++;
	}
	catch(_exception)
	{
		struct_foreach(_exception, function(i, v)
		{
			print($"Cutscene Manager :: ERROR ({i}, {v})");
		});
	}
}