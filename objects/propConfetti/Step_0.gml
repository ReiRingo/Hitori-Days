#region Rotation
_rot += 0.5;
_rot %= 360.0;
image_angle = _rot;
#endregion

#region Death
if (y >= _dTarget) {
	instance_destroy();
	exit;
}
#endregion

#region Gravity Wave
gravity_direction = Direction.Down + (sin((current_time / 200) + _gravDirShift) * 24.0);
#endregion