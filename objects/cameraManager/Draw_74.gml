var w = display_get_gui_width();
var h = display_get_gui_height();

if (!surface_exists(guiSurface)) {
    guiSurface = surface_create(w, h);
}

surface_set_target(guiSurface);
draw_clear_alpha(c_black, 0);