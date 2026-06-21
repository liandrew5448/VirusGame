movespeed = 1;

if place_meeting(x,y,oGreenery)
{
	movespeed = 0.5;	
}

ysp = 0;
xsp = 0;

if keyboard_check(vk_left)
{
	xsp = -movespeed
}

if keyboard_check(vk_right)
{
	xsp = movespeed
}

if keyboard_check(vk_up)
{
	ysp = -movespeed
}

if keyboard_check(vk_down)
{
	ysp = movespeed
}

move_and_collide(xsp,ysp,oBricks)
