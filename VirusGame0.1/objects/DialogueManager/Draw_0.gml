if (global.is_paused && instance_exists(global.active_npc)) {
    var _cam = view_camera[0];
    var _cam_x = camera_get_view_x(_cam);
    var _cam_y = camera_get_view_y(_cam);
    var _cam_w = camera_get_view_width(_cam);
    var _cam_h = camera_get_view_height(_cam);
    
    // Dim background
    draw_set_color(c_black);
    draw_set_alpha(0.4);
    draw_rectangle(_cam_x, _cam_y, _cam_x + _cam_w, _cam_y + _cam_h, false);
    draw_set_alpha(1.0);
    
    // Render NPC sprite
    if (sprite_exists(global.active_npc.sprite_index)) {
        var _sprite_w = sprite_get_width(global.active_npc.sprite_index);
        draw_sprite(global.active_npc.sprite_index, 0, _cam_x + _cam_w - _sprite_w - 20, _cam_y + (_cam_h * 0.2));
    }
    
    // Chat Box canvas
    var _box_x1 = _cam_x + 15;
    var _box_y1 = _cam_y + (_cam_h * 0.65);
    var _box_x2 = _cam_x + _cam_w - 15;
    var _box_y2 = _cam_y + _cam_h - 10;
    
    draw_set_color(c_dkgray); 
    draw_rectangle(_box_x1, _box_y1, _box_x2, _box_y2, false);
    
    // Text String Check
    draw_set_color(c_white);
    if (dialogue_index < array_length(global.active_npc.npc_lines)) {
        var _current_text = global.active_npc.npc_lines[dialogue_index];
        draw_text_ext(_box_x1 + 10, _box_y1 + 10, _current_text, 14, (_box_x2 - _box_x1) - 20);
    }
    
    // Prompt
    draw_set_color(c_yellow);
    var _is_last_line = (dialogue_index == array_length(global.active_npc.npc_lines) - 1);
    var _prompt = _is_last_line ? "[SPACE] Exit" : "[SPACE] Next";
    draw_text(_box_x1 + 10, _box_y2 - 25, _prompt);
    
    // Green OK Button Panel
    var _btn_x1 = _box_x2 - 70;
    var _btn_y1 = _box_y2 - 25;
    var _btn_x2 = _box_x2 - 10;
    var _btn_y2 = _box_y2 - 10;
    
    draw_set_color(c_green);
    draw_rectangle(_btn_x1, _btn_y1, _btn_x2, _btn_y2, false);
    
    // Centered Text
    draw_set_color(c_white);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_text((_btn_x1 + _btn_x2) / 2, (_btn_y1 + _btn_y2) / 2, "OK");
    
    // Reset defaults
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}