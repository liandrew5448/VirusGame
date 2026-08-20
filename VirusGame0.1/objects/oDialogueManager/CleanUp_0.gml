if (variable_instance_exists(id, "pause_surf")) {
    if (surface_exists(pause_surf)) {
        surface_free(pause_surf);
    }
}