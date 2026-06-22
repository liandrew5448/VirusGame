global.last_game_room = noone;

// Check if a save file already exists on the player's machine
if (file_exists("savegame.txt")) {
    // 1. Open the file and read the string
    var _file = file_text_open_read("savegame.txt");
    var _json_string = file_text_read_string(_file);
    file_text_close(_file);
    
    // 2. Turn the string back into a GameMaker struct
    var _loaded_data = json_parse(_json_string);
    
    // 3. Extract the room variable we stored
    global.last_game_room = _loaded_data.saved_room;
}

// Automatically go to the main menu after checking for the save file
room_goto(MainMenu);