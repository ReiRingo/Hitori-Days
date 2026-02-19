// Inherit the parent event
event_inherited();

text = Lang.get("dialogue_cone");

event = function() {
	dialogueStart(text);
};