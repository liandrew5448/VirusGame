action = function() {
    show_debug_message("run pressed");
    
    if (instance_exists(oBattleSwitcher)) {
        // Force GameMaker to recognize the target as a valid room asset ID
        var _target_room = asset_get_index(room_get_name(oBattleSwitcher.original_room));
        room_goto(_target_room);
    } else {
        show_debug_message("oBattleSwitcher is missing entirely!");
    }
}