// 1. Gather all the data you want to save into a struct
var _save_data = {
    saved_room: global.last_game_room,
    // If you want to save player coordinates later, you can add them here:
    // player_x: obj_player.x,
    // player_y: obj_player.y
};

// 2. Convert that struct into a readable string of text (JSON)
var _json_string = json_stringify(_save_data);

// 3. Open a text file, write the string into it, and close it cleanly
var _file = file_text_open_write("savegame.txt");
file_text_write_string(_file, _json_string);
file_text_close(_file);

show_debug_message("Game Saved Securely!");