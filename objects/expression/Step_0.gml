if (_ending && image_index <= 0.1) instance_destroy();

if (instance_exists(target)) {
	x = target.x + targetOffset.x;
	y = target.y + targetOffset.y;
}