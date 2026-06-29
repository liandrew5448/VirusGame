if (global.is_paused && instance_exists(global.active_npc)) {
    var _mouse_x = mouse_x;
    var _mouse_y = mouse_y;
    
    // 1. Fetch exact camera positioning matching the Draw event math 1:1
    var _cam = view_camera[0];
    var _cam_x = camera_get_view_x(_cam);
    var _cam_y = camera_get_view_y(_cam);
    var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
    
    // 2. Track boundaries using absolute world positions
    var _box_x2 = _cam_x + _cam_w - 15;
    var _box_y2 = _cam_y + _cam_h - 10;
    
    var _btn_x1 = _box_x2 - 70;
    var _btn_y1 = _box_y2 - 25;
    var _btn_x2 = _box_x2 - 10;
    var _btn_y2 = _box_y2 - 10;
    
    // 3. Precise click engine translation
    var _clicked_ok = (mouse_check_button_pressed(mb_left) && 
                       _mouse_x >= _btn_x1 && _mouse_x <= _btn_x2 && 
                       _mouse_y >= _btn_y1 && _mouse_y <= _btn_y2);

    // 4. Clean exit sequence function (Triggers player immunity cooldown)
    var _close_dialogue = function() {
	    global.is_paused = false;
	    global.active_npc = noone;
    
	    // Find your player instance and inject a 60-frame (1 full second) lockout window
	    var _player = instance_find(oPlayer, 0);
	    if (_player != noone) {
	        _player.dialogue_cooldown = 60; 
	    }
	}

    // Route A: Left-click OK button area
    if (_clicked_ok) {
        _close_dialogue();
    }
    
    // Route B: Spacebar navigation tracking
    if (keyboard_check_pressed(vk_space)) {
        // Prevent accidental frame skips
        keyboard_clear(vk_space); 
        
        if (dialogue_index < array_length(global.active_npc.npc_lines) - 1) {
            dialogue_index += 1;
        } else {
            _close_dialogue();
        }
    }
}