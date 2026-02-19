function __StringHelpersLib() constructor {
	static charAt = function(str, index) {
		return string_char_at(str, index + 1);
	}
	
	static length = function(n) {
		return string_length(n);
	}
	
	static reverse = function(n) {
		var _out = "";
		for (var i = self.length(n) - 1; i >= 0; --i) {
			_out += self.charAt(n, i);
		}
		return _out;
	}
}

#macro String global.__stringHelpersLib
String = new __StringHelpersLib();

String.charAt("HELLO", 0); // 'H'