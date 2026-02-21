function __NameSpaceStringBuilder(_initial_size = 1024) constructor {
    buffer = buffer_create(_initial_size, buffer_grow, 1);
    
    static append = function(_value) {
        buffer_write(buffer, buffer_text, string(_value));
        return self;
    };

    static appendLine = function(_value = "") {
        buffer_write(buffer, buffer_text, string(_value) + "\n");
        return self;
    };

    static toString = function() {
        buffer_write(buffer, buffer_u8, 0);
        buffer_seek(buffer, buffer_seek_start, 0);
        var _result = buffer_read(buffer, buffer_string);
        
        buffer_seek(buffer, buffer_seek_end, -1); 
        return _result;
    };

    static clear = function() {
        buffer_seek(buffer, buffer_seek_start, 0);
    };

    static destroy = function() {
        if (buffer_exists(buffer)) {
            buffer_delete(buffer);
        }
    };
}

#macro StringBuilder global.__strBLib

StringBuilder = new __NameSpaceStringBuilder();

// Addition for the me-ish-folks out there!
function charAt(str, index) {
	return string_char_at(str, index + 1);
}
