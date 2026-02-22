function _internal__ConsoleLib__() constructor
{
	static out = function(str)
	{
		for (var i = 1; i < argument_count; ++i)
		{
			str += string(argument[i]) + " ";
		}
		
		show_debug_message(string(str));
	}
	
	static outf = function(str) {
		var _args = [];
		for (var i = 1; i < argument_count; ++i) {
			array_push(_args, argument[i]);
		}
		
		var _out = "";
		for (var i = 0; i < string_length(str); ++i) {
			if (charAt(str, i) == "%") {
				var _sw = "";
				switch(charAt(str, i + 1)) {
					case "s":
						for (var j = 0; j < array_length(_args); ++j) {
							if (_args[j] != "\0" && is_string(_args[j])) {
								_sw += _args[j];
								_args[j] = "\0";
								i += 2;
								break;
							}
						}
						break;
					
					case "d":
					case "i":
						for (var j = 0; j < array_length(_args); ++j) {
							if (_args[j] != "\0" && is_real(_args[j])) {
								_sw += string(_args[j]);
								_args[j] = "\0";
								i += 2;
								break;
							}
						}
						break;
						
				}
				_out += _sw;
				
			}
			_out += charAt(str, i) ?? "";
		}
		
		self.out(_out);
	}
}

#macro Console global._internal_consoleLibHold
Console = new _internal__ConsoleLib__();