_canCollide = true;

event = function() {
	var player = charPlayer, kita = followerKita, ryo = followerRyo;
	var where;
	
	if !(instance_exists(player) || instance_exists(kita) || instance_exists(ryo)) return;
	
	var cur;
	
	// -- Kita
	cur = kita;
	where = point_direction(cur.x, cur.y, player.x, player.y);
	if (where <= 45 || where > 270 + 45) { // -45 & 360...? What, 270 + 45?
		cur.dir = DirStates.Right;
	} else if (where > 45 && where <= 90 + 45) {
		cur.dir = DirStates.Up;
	} else if (where > 90 + 45 && where <= 180 + 45) {
		cur.dir = DirStates.Left;
	} else if (where > 180 + 45 && where <= 270 + 45) {
		cur.dir = DirStates.Down;
	}
	
	// -- Ryo
	cur = ryo;
	where = point_direction(cur.x, cur.y, player.x, player.y);
	if (where <= 45 || where > 270 + 45) {
		cur.dir = DirStates.Right;
	} else if (where > 45 && where <= 90 + 45) {
		cur.dir = DirStates.Up;
	} else if (where > 90 + 45 && where <= 180 + 45) {
		cur.dir = DirStates.Left;
	} else if (where > 180 + 45 && where <= 270 + 45) {
		cur.dir = DirStates.Down;
	}
	
	var c = Cutscene.create();
	
	Cutscene.playerMoveable(c, false);
	Cutscene.startDialogue(c, Lang.get("cutscene_kessoku1"));
	Cutscene.action(c, function() { expressionCreate(charPlayer, sprExHappy) });
	Cutscene.sleep(c, 20);
	Cutscene.startDialogue(c, Lang.get("cutscene_kessoku2"));
	Cutscene.action(c, function() {
		// Jump Animation
		with(followerKita) {
			doAnime(y, y - 14, 5, TweenSineOut, function(a) {
				y = a;
			});
			
			var func = function() {
				doAnime(y, y + 14, 5, TweenSineIn, function(a) {
					y = a;
				});
				
				return true;
			};
			
			call_later(6, time_source_units_frames, func);
		}
		
		expressionCreate(followerKita, sprExExclam);
	});
	Cutscene.sleep(c, 20);
	Cutscene.startDialogue(c, Lang.get("cutscene_kessoku3"));
	Cutscene.action(c, function() { faderFade(0, 1, 15, c_black); });
	Cutscene.sleep(c, 17);
	Cutscene.action(c, function() {
		followerKita.following = true;
		followerRyo.following = true;
		faderFade(1, 0, 15, c_black);
	});
	Cutscene.sleep(c, 30);
	Cutscene.action(c, audio_pause_all);
	Cutscene.startDialogue(c, Lang.get("notif_join_kessoku"));
	Cutscene.action(c, audio_resume_all);
	Cutscene.playerMoveable(c, true);
	
	Cutscene.play(c);
	instance_destroy();
};