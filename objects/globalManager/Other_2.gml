// -- Control Bind

// Confirm
Input.Bind(
	VKey.Confirm,
	[ord("Z"), vk_enter, vk_space]
);

// Cancel
Input.Bind(
	VKey.Cancel,
	[ord("X"), vk_shift]
);

// Arrow keys
Input.Bind(
	VKey.Up,
	[vk_up]
);
Input.Bind(
	VKey.Down,
	[vk_down]
);
Input.Bind(
	VKey.Right,
	[vk_right]
);
Input.Bind(
	VKey.Left,
	[vk_left]
);

// Misc:
Input.Bind(
	"res",
	[vk_f2]
);

room_goto(roomLogo);