var target = targetDeg;

with(charRyo) {
	target = point_direction(other.x, other.y, x, y);
}

image_angle = target % 360;

var depthTarget = Depth.World - y;

with(charPlayer) {
	depthTarget = depth;
	other.x = x;
	other.y = y - 16;
}

depth = depthTarget;