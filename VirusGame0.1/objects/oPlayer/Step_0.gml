// 1. Always tick down your dialogue cooldown first thing
if (dialogue_cooldown > 0) {
    dialogue_cooldown -= 1;
}

// 2. Set dynamic movement speed based on terrain modifiers
movespeed = 1;

if (place_meeting(x, y, oGreenery)) {
    movespeed = 0.5;    
}

if (place_meeting(x, y, oPath)) {
    movespeed = 1.5;
}

// 3. Reset speed vectors for this frame
xsp = 0;
ysp = 0;

// 4. Input Gathering: ONLY read keys if the game is NOT paused
if (!global.is_paused) {
    if (keyboard_check(vk_left))  { xsp = -movespeed; }
    if (keyboard_check(vk_right)) { xsp = movespeed;  }
    if (keyboard_check(vk_up))    { ysp = -movespeed; }
    if (keyboard_check(vk_down))  { ysp = movespeed;  }
}

// 5. Execute engine collisions (Safely sits at 0,0 if paused)
move_and_collide(xsp, ysp, oBricks);


// 6. SAFE PROXIMITY DIALOGUE TRIGGER (Replaces the collision event)
// Only check for a new dialogue if we are not paused AND the cooldown has finished
if (!global.is_paused && dialogue_cooldown <= 0) {
    
    // Check if you are physically overlapping an NPC
    var _npc = instance_place(x, y, oFriendlyNPC); 
    
    if (_npc != noone) {
        global.is_paused = true;
        global.active_npc = _npc; // Target this specific NPC instance
        
        var _manager = instance_find(DialogueManager, 0);
        if (_manager == noone) {
            _manager = instance_create_layer(0, 0, "Instances", DialogueManager);
        }
        _manager.dialogue_index = 0;
    }
}
