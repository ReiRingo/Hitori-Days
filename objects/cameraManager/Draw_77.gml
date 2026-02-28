var _winW = window_get_width();
var _winH = window_get_height();

var _aspectScale = min(_winW / _port.x, _winH / _port.y);

var _drawW = _port.x * _aspectScale;
var _drawH = _port.y * _aspectScale;

var _drawX = (_winW - _drawW) / 2;
var _drawY = (_winH - _drawH) / 2;

if (surface_exists(application_surface)) {
    if (CRT) {
        shader_set(ntsc);
        var _surfW = surface_get_width(application_surface);
        var _surfH = surface_get_height(application_surface);
        shader_set_uniform_f(ntscResolution, _surfW, _surfH);
        shader_set_uniform_f(ntscTime, current_time / 1000);
    }

    draw_surface_ext(application_surface, _drawX, _drawY, _aspectScale, _aspectScale, 0, c_white, 1);

    if (CRT) {
        shader_reset();
    }

}