targetRoom = roomYoko2;
targetSp = 1;

newEvent = event;

event = function() {
	var flag = (Save.get(SType.Cutscenes, KitaFollow, false) && Save.get(SType.Cutscenes, RyoFollow, false));
	
	if (!flag) {
		newEvent();
	} else {
		var c = Cutscene.create();
		
		Cutscene.playerMoveable(c, false);
		Cutscene.action(c, function() {
			dialogueStart(Lang.get("dialogue_dont_go_home_yet"));
		});
		Cutscene.charMove(c, charPlayer, DirStates.Right, 15);
		Cutscene.playerMoveable(c, true);
		Cutscene.endOnQueue(c);
		
		Cutscene.play(c);
	}
};