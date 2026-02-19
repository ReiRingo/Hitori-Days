function _internal__ConsoleLib__() constructor
{
	static out = function(str)//-> void
	{
		for (var i = 1; i < argument_count; ++i)
		{
			str += string(argument[i]) + " ";
		}
		
		show_debug_message(string(str));
	}
}

#macro Console global._internal_consoleLibHold

Console = new _internal__ConsoleLib__();

Console.out("HELLO YEA");