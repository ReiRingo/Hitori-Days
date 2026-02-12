function DialogueClass(_text) constructor
{
	self.text = (is_array(_text)) ? _text : [string(_text)];
	self.inst = noone;
	
	static Start = function()
	{
		self.inst = instance_create_depth(0, 0, 0, dialogueManager);
		self.inst.text = self.text;
	};
	
	static GetTyper = function()
	{
		return (self.inst);
	};
	
	static Voice = function(where, snd, pitch = [1, 1], oneIndexed = true)
	{
		var _index = (oneIndexed) ? where - 1 : where;
		var _voice = { v : snd, p : pitch };
		
		with(self.inst)
		{
			voice[_index] = _voice;
		}
	};
}