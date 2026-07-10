if (keyboard_check_pressed(vk_escape)) {
	
    if (!variable_global_exists("is_paused")) global.is_paused = false;

    global.is_paused = true;
	global.last_game_room = room; 
	
	if (room == FileRoom) {
		global.last_game_room = global.prev_room;
		room_goto(MainMenu);
	}
	else {
		room_goto(MainMenu);   
	}
}