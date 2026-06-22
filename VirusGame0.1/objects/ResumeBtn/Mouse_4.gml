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
    var _room_name = _loaded_data.saved_room; 
    
    // Convert the text name into a valid GameMaker room handle
    var _target_room = asset_get_index(_room_name);
    
    if (_target_room != -1 && room_exists(_target_room)) {
        global.last_game_room = _target_room; 
        global.is_paused = false;
        instance_activate_all();   
        room_goto(_target_room);   
    } else {
        show_debug_message("Saved room asset '" + string(_room_name) + "' could not be found! Defaulting to Testroom.");
        room_goto(Testroom); // Fallback if the file exists but the room name inside is invalid
    }
} 
// 3. THIRD PRIORITY: No active session in memory AND no save file exists (Fresh Start)
else {
    show_debug_message("No save file found. Starting fresh in Testroom!");
    global.last_game_room = Testroom; // Initialize your memory tracker
    global.is_paused = false;
    instance_activate_all();
    room_goto(Testroom); // Direct the engine to load Testroom
}