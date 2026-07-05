if (room == MainMenu || room == StartMenu) 
{
    if (mouse_check_button_pressed(mb_left)) 
    {
		var sbtn = instance_position(mouse_x, mouse_y, SaveBtn)
        var lbtn = instance_position(mouse_x, mouse_y, LoadBtn);
        
		if (sbtn != noone) 
        {
			global.save_choose = true;
			global.prev_room = global.last_game_room;
            room_goto(FileRoom);
			show_debug_message("SaveGame() completed successfully.");
        }
		
        if (lbtn != noone) 
        {
			global.load_choose = true;
			global.prev_room = global.last_game_room;
            room_goto(FileRoom);
			show_debug_message("LoadGame() completed successfully.");
        }
    }
}