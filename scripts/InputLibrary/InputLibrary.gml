// -- Init
global.inputs = {};

// -- Namespace
#macro Input global.inputFunc

// -- Functions
Input =
{
	Bind: function(_action, _keys) {
	global.inputs[$ string(_action)] = is_array(_keys) ? _keys : [_keys];
	},
	
	Held: function(_action) {
		var _keys = global.inputs[$ string(_action)];
		if (_keys == undefined) return false;
		
		for (var i = 0; i < array_length(_keys); i++) {
			if (keyboard_check(_keys[i])) return true;
		}
		return false;
	},
	
	Pressed: function(_action) {
		var _keys = global.inputs[$ string(_action)];
		if (_keys == undefined) return false;
		
		for (var i = 0; i < array_length(_keys); i++) {
			if (keyboard_check_pressed(_keys[i])) return true;
		}
		return false;
	}
};