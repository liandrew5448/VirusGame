if (room != MainMenu && room != StartMenu) {
    
    if (global.is_loading_from_file == true || global.is_paused == false) {
        LoadRoom();
        global.is_loading_from_file = false; 
    }
}