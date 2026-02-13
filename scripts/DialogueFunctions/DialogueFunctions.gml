function dialogueStart(_text, _voiceInput = [1, sndTextDefault], _pitchInput = [0.8, 1.2])
{
    var _d = new DialogueClass(_text);
    
    _d.Start();
	
    var _page = 0;
    var _sound = -1;
    
    if (is_array(_voiceInput) && array_length(_voiceInput) >= 2)
	{
        _page = _voiceInput[0] - 1;
        _sound = _voiceInput[1];
    }
	else if (audio_exists(_voiceInput))
	{
        _sound = _voiceInput;
    }

    var _p = (is_array(_pitchInput) && array_length(_pitchInput) >= 2) 
             ? [_pitchInput[0], _pitchInput[1]] 
             : [0.8, 1.2];

    if (audio_exists(_sound))
	{
		print("HEY!");
        _d.Voice(_page, _sound, _p, false);
    }
    
    return _d;
}