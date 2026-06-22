if (keyboard_check_pressed(vk_escape)) {
    if (!variable_global_exists("is_paused")) global.is_paused = false;

    global.is_paused = true;
    global.last_game_room = room; // Remember this room!
    
    instance_deactivate_all(true); // Freeze everything in the level
    room_goto(MainMenu);           // Jump to the menu room
}