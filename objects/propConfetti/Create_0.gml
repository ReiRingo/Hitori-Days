// -- Randomised Sprite Index
var _sprite = { count : sprite_get_number(sprite_index) };
image_index = irandom(_sprite.count - 1);
delete _sprite;

// -- Rotation
_rot = 0.0;

// -- Random Colour
colourList = [
	c_yellow,
	c_red,
	c_blue,
	c_purple
];
image_blend = colourList[irandom(array_length(colourList) - 1)];

// -- Death Target
_dTarget = room_height + 10.0;

// -- Gravity
gravity = 0.08 + random(0.1);
gravity_direction = Direction.Down;
_gravDirShift = random(20);