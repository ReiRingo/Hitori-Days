function __InputLibInternal() constructor {
	// -- Internal Stuff
	static __keys = {};
	static __slot = 0; // Consoles
	// *********************************
	//
	//
	//
	// *********************************
	#region -- Bind & Clearing
	
	static bind = function(_action, _keys) {
		var _k = (is_array(_keys)) ? _keys : [ _keys ];
		__keys[$ _action] = _k;
		return true;
	}
	
	static add = function(_action, _keys) {
		if (!is_array(__keys[$ _action])) return false;
		
		var _k = (is_array(_keys)) ? _keys : [ _keys ];
		
		for (var i = 0; i < array_length(_k); ++i) {
			array_push(__keys[$ _action], _k[i]);
		}
		
		return true;
	}
	
	#endregion
	// *********************************
	//
	//
	//
	// *********************************
	#region -- Action Methods
	
	static isPressed = function(_action) {
		if (!is_array(__keys[$ _action])) return false;
		
		var _k = __keys[$ _action];
		for (var i = 0; i < array_length(_k); ++i) {
			var _key = _k[i];
			
			if (keyboard_check_pressed(_key)) return true;
			
			if (gamepad_is_connected(__slot)) {
				if (gamepad_button_check_pressed(__slot, _key)) return true;
			}
		}
		
		return false;
	}
	
	static isHeld = function(_action) {
		if (!is_array(__keys[$ _action])) return false;
		
		var _k = __keys[$ _action];
		for (var i = 0; i < array_length(_k); ++i) {
			var _key = _k[i];
			
			if (keyboard_check(_key)) return true;
				
			if (gamepad_is_connected(__slot)) {
				if (gamepad_button_check(__slot, _key)) return true;
			}
		}
		
		return false;
	}
	
	#endregion
	// *********************************
	//
	//
	//
	// *********************************
	#region -- Gamepad Actions
	// TODO: Gamepad
	#endregion
}

#macro Input global.__inputlibexternal
Input = new __InputLibInternal();