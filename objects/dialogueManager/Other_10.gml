/// RESET
if (_pageIndex >= array_length(text))
{
	instance_destroy();
	exit;
	// No out animation is an intention ;>
}

text[_pageIndex] = string_replace_all(text[_pageIndex], "[/scale]", "[scale, 2]");
text[_pageIndex] = string_replace_all(text[_pageIndex], "%y", string(States.getYen()));
text[_pageIndex] = string_replace_all(text[_pageIndex], "%t", timeFormatter(States.getTime()));

var _text = "[scale, 2]" + text[_pageIndex];

var _voice = {
	v : -1,
	p : [1, 1]
};


if (array_length(voice) > 0) 
{
	// print($"array check THIS WORKS! With {array_length(voice)} in length");
	var _proc = min(array_length(voice) - 1, _pageIndex);
	
	while (_proc >= 0) 
	{
		if (is_struct(voice[_proc]) && audio_exists(voice[_proc].v)) 
		{
			_voice = voice[_proc];
			break;
		}
		_proc--;
	}
}

_scrib = scribble(_text);
_typist.in(typerSpeed, 0.1);
if (audio_exists(_voice.v))
{
	_typist.sound_per_char([_voice.v], _voice.p[0], _voice.p[1], , 1);
}