function camShaker(time, intensity)
{
	if (instance_exists(cameraManager))
	{
		cameraManager._intensity = intensity;
		cameraManager._shake = abs(time);
	}
}