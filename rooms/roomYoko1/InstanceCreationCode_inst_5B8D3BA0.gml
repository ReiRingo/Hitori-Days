event = function() {
	var _f = Save.get(SType.Cutscenes, "money_help", false);
	
	if (!_f) {
		dialogueStart(Lang.get("dialogue_helper_balance1"));
		Save.set(SType.Cutscenes, "money_help", true);
	}
	else {
		dialogueStart(Lang.get("dialogue_helper_balance2"));
	}
};

// My allman days have passed.
// I may now embrace you, Java.