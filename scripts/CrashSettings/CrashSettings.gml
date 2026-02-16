global.crashSprite = "Exception Handler/bccr.png";
global.crash = {
	spr : -1,
	w : 640,
	h : 480
};

exception_unhandled_handler(function(_exception)
{
    var _res = "Oh no, Bocchi has crashed!\nBadly!\n\n";
    var _keys = struct_get_names(_exception);
	
	_res += string_replace_all(_exception.longMessage, ",", "\n");
	_res += $"\nStacktrace: {_exception.stacktrace[0]}, {_exception.stacktrace[1]}";
	_res += "\n\nWant to report an issue / bug?\nFile an issue at\nhttps://github.com/ReiRingo/Hitori-Days";
	
	var _fullPath = global.crashSprite;
	
	Window.Crash(_res, global.crash.w, global.crash.h, _fullPath);
	
	return 0;
});