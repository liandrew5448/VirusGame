if (keyboard_check(vk_left)) 
{ 
	if(folderLEFT > 0)
	{
		setFolder(-1);
	}
}
if (keyboard_check(vk_right))
{
	if(folderRIGHT % 4 > 0)
	{
		setFolder(1);
	}
}
if (keyboard_check(vk_up))
{
	if(folderUP > 0)
	{
		setFolder(-4);
	}
}
if (keyboard_check(vk_down)) 
{
	//set to the total number of folder spawned
	if(folderDOWN < oBattleManager.maxFolders)
	{
		setFolder(4);
	}
}