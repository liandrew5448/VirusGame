if (global.last_game_room != noone) {
    global.is_paused = false;
    instance_activate_all();  
    room_goto(global.last_game_room); 
} 
// 2. SECOND PRIORITY: If memory is empty, try loading from the physical file (Fresh Boot)
else if (file_exists("savegame.txt")) {
    var _file = file_text_open_read("savegame.txt");
    var _json_string = file_text_read_string(_file);
    file_text_close(_file);
    
    var _loaded_data = json_parse(_json_string);
    var _target_room = _loaded_data.saved_room;
    
    if (room_exists(_target_room)) {
        global.last_game_room = _target_room; // Update memory for next time
        global.is_paused = false;
        instance_activate_all();   
        room_goto(_target_room);   
    }
} else {
    show_debug_message("Nothing to resume from memory or file!");
}