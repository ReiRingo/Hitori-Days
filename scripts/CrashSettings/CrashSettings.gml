global.crashLink = "github.com/ReiRingo/Hitori-Days";
global.crashOpenLink = true;
global.crashSprite = "Exception Handler/bccr.png";
global.crash = {
	spr : -1,
	w : 640 + (800 - 640),
	h : 480 + (800 - 640)
	// This is how bad I am at math!
};

exception_unhandled_handler(function(_exception)
{
	// No audios cus yeaa
    audio_stop_all();

    var res = "--- CRITICAL ERROR ---\n";
    res += "Bocchi has glitched... badly!\n\n";

    // Raw message
    var msg = string(_exception.message);

    // Clean internal markers
    // msg = string_replace_all(msg, "###", "");

    // Split message into lines
    var lines = string_split(msg, "\n");
	
    res += "Details:\n";

    for (var i = 0; i < array_length(lines); ++i)
    {
        var line = string_trim(lines[i]);
		
        if (line != "")
        {
            res += "  " + line + "\n";
        }
    }
	
	lines = pointer_null;
	msg = pointer_null;

    res += "\nStacktrace:\n";

    var slen = array_length(_exception.stacktrace);
	
	var strace;
	
    for (var i = 0; i < min(slen, 5); ++i)
    {
        strace = string(_exception.stacktrace[i]);
		strace = string_replace_all(strace, "gml_Object_", "In object & event: ");
		strace = string_replace_all(strace, "gml_Script_", "In script: ");
		strace = string_replace_all(strace, "_", " ");
		// ^ This will make your object look obj player if you're using snake_case.
		// BUt for my case, I'm using camelCase, sooo
		res += $"> {strace}\n";
    }
	
	strace = pointer_null; // RIP YYString struct.

    res += "\n----------------------\n";
    res += "Report here:\n";
    res += $"{global.crashLink}\n";

    var fpath = working_directory + global.crashSprite;
    fpath = string_replace_all(fpath, "/", "\\");
	
	// var openLink = global.crashOpenLink;
	
	// delete global;
	// ^ This will give you a compile time error
	// "Cannot set global to a constant"
	
	clipboard_set_text(res);
	
	
	var pad = function(_val) { return string_replace(string_format(_val, 2, 0), " ", "0"); }
	var logString = pad(current_hour) + ":" + pad(current_minute) + ":" + pad(current_second);
	logString += $"\n{res}\n\n";
	
	var log = file_text_open_append(working_directory + "crash_log.txt");
	file_text_write_string(log, logString);
	file_text_close(log);
	
	logString = pointer_null;
	
	res += $"\n(Error text copied to clipboard and saved to logs at {working_directory}!)";
	
    Window.Crash(res, global.crash.w, global.crash.h, fpath);
	
	// WAS gonna make it so it opens the link, but GameMaker is dead at this point.
	// And will resort to a Visual Runtime C++ crash instead!
	// if (openLink) url_open($"{global.crashLink}/issues/new");
	
    return 0;
});