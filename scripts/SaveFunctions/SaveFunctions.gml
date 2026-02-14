/// @desc Takes the raw heartbeat count and returns "MM:SS"
function timeToFrame(_raw_time)
{
    // Convert heartbeats to total seconds
    // Since it increments every 30 frames (0.5s), 2 heartbeats = 1 second
	// The game is in 30 fps lmao
    var _total_seconds = _raw_time; 
    
    var _minutes = floor(_total_seconds / 60);
    var _seconds = floor(_total_seconds % 60);
    
    // Format with leading zeros (e.g., 05:09)
    var _m_str = (_minutes < 10) ? "0" + string(_minutes) : string(_minutes);
    var _s_str = (_seconds < 10) ? "0" + string(_seconds) : string(_seconds);
    
    return _m_str + ":" + _s_str;
}

// Thank you for the subroutine duddeeee!!!!