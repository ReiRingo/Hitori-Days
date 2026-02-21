///Reset

// -- Size & Offset
baseWidth = Camera.Width;
baseHeight = Camera.Height;

offsetWidth = 150;

// -- Follow ?
target = noone;
roomBound = true;

// -- Shake
shakeOffset = new Vector2(0, 0);
_shake = 0;
_intensity = 0;

// -- Port Set
view_enabled = true;
view_visible[0] = true;

_port = new Vector2(baseWidth * 3 + offsetWidth, baseHeight * 3);

camera_set_view_size(view_camera[0], baseWidth, baseHeight);

view_set_wport(0, _port.x); 
view_set_hport(0, _port.y);

surface_resize(application_surface, _port.x, _port.y);