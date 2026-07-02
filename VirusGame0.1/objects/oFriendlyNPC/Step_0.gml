// 1. ABSOLUTE TOP: If the dialogue system is active, freeze completely and skip the AI
if (global.is_paused) {
    hspeed = 0;
    vspeed = 0;
    speed = 0;
    
    if (path_index != -1) {
        path_speed = 0;
    }
    
    image_speed = 0; 
    exit; // Stops the wandering/movement code below from running at all!
} else {
    // Unfreeze animations when the box closes
    if (image_speed == 0) {
        image_speed = 1;
    }
}

if irandom(room_speed * 2) = 1 {
	var Range = 256; //length of travel
	DestX = x + irandom_range(-Range, Range);
	DestY = y + irandom_range(-Range, Range);
	
	//keep DesyX &  Y in room
	if DestX < 0 {DestX = 0};
	if DestY < 0 {DestY = 0};
	if DestX > room_width {DestX = room_width}
	if DestY > room_height {DestY = room_height}
	
	//Check for collision at destination
	if place_meeting(DestX, DestY, oBricks)
	{
		DestX = x;
		DestY = y;
	}
} else
{
	if distance_to_point(DestX, DestY) > 1
	{
		mp_potential_step_object(DestX, DestY, movespeed, oBricks);
		image_speed = 1;
	} else
	{
		DestX = x;
		DestY = y;
		image_speed = 0;
		image_index = 0;
	}
}
