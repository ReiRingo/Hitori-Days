///At Ready
print("Called event 0!");
_resetting = true;
doAnime(
	1, 0, 50, "linear",
	function(a)
	{
		image_alpha = a;
		if (a == 0)
		{
			if (image_index < sprite_get_number(sprite_index) - 1 && !_skipping)
				image_index++;
			else
			{
				//print("DIE");
				room_goto(roomIntro);
			}
			event_user(1);
		}
	}
);