var _winW = window_get_width();
var _winH = window_get_height();

var _aspectScale = min(_winW / _port.x, _winH / _port.y);

var _drawW = _port.x * _aspectScale;
var _drawH = _port.y * _aspectScale;

var _drawX = (_winW - _drawW) / 2;
var _drawY = (_winH - _drawH) / 2;

draw_surface_ext(application_surface, _drawX, _drawY, _aspectScale, _aspectScale, 0, c_white, 1);