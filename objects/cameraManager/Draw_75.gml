surface_reset_target();

if (surface_exists(guiSurface)) {
    if (CRT) {
        shader_set(ntsc);
        shader_set_uniform_f(ntscResolution, surface_get_width(guiSurface), surface_get_height(guiSurface));
        shader_set_uniform_f(ntscTime, current_time / 1000);
    }
    
    draw_surface(guiSurface, 0, 0);
    
    if (CRT) {
        shader_reset();
    }
}