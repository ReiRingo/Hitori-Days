var _c = Cutscene.create();

Cutscene.playerMoveable(_c, false);
Cutscene.sleep(_c, 15);
Cutscene.charMoveTarget(_c, charPlayer, 128, 712);
Cutscene.sleep(_c, 8);
Cutscene.action(_c, function() { cameraManager.target = noone; });
Cutscene.charTurn(_c, charPlayer, DirStates.Up);
Cutscene.action(_c, function() {
	expressionCreate(charPlayer, sprExExclam);
});
Cutscene.sleep(_c, 30);
Cutscene.action(_c, function() {
	with(cameraManager) {
		var _speed = 65;
		
		doAnime(x, 120, _speed, TweenSineInOut, function(a) {
			x = a;
		});
		
		doAnime(y, 248, _speed, TweenSineInOut, function(a) {
			y = a;
		});
	}
});
Cutscene.sleep(_c, 68);
Cutscene.action(_c, function() {
	expressionCreate(followerKita, sprExHappy);
});
Cutscene.sleep(_c, 22);
Cutscene.action(_c, function() {
	with(cameraManager) {
		var _speed = 65;
		
		doAnime(x, other.x, _speed, TweenSineInOut, function(a) {
			x = a;
		});
		
		doAnime(y, other.y, _speed, TweenSineInOut, function(a) {
			y = a;
		});
	}
});
Cutscene.sleep(_c, 65 + 12);
Cutscene.action(_c, function() { faderFade(0, 1, 15, c_black); });
Cutscene.sleep(_c, 20);
Cutscene.action(_c, function() { faderFade(1, 0, 15, c_black); });
Cutscene.sleep(_c, 16);
Cutscene.charTurn(_c, charPlayer, DirStates.Right);
Cutscene.playerMoveable(_c, true);
Cutscene.action(_c, function() {
	cameraManager.target = self;
});

Cutscene.play(_c);