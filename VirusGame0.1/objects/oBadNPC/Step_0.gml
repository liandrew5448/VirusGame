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

if place_meetiing(x, y, oPlayer)
{
	room_restart();
}