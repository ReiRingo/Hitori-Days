var _w = display_get_gui_width();
var _h = display_get_gui_height();

if (!surface_exists(guiSurface)) {
    guiSurface = surface_create(_w, _h);
}

surface_set_target(guiSurface);
draw_clear_alpha(c_black, 0);