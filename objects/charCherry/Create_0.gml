// Inherit the parent event
event_inherited();

sprite[SpriteState.Idle].down = sprCherryFront;
sprite[SpriteState.Idle].up = sprCherryBack;
sprite[SpriteState.Idle].left = sprCherrySide;
sprite[SpriteState.Idle].right = sprCherrySide;
sprite[SpriteState.Idle].speed = 0;

sprite[SpriteState.Move].down = sprCherryFront;
sprite[SpriteState.Move].up = sprCherryBack;
sprite[SpriteState.Move].left = sprCherrySide;
sprite[SpriteState.Move].right = sprCherrySide;
sprite[SpriteState.Move].speed = 1;

mask_index = sprCherryFront;

moveSpeed = 5;

/*
myJs = @'
// GMRT Test?
const speed = 100;

function doSomething() {
	const mat = ["Sunlight", "Food", "Water", "Oxygen"];
	var _lens = mat.map(m => m.length);
	console.log(`Lengths are ${_lens}`);
}';
*/