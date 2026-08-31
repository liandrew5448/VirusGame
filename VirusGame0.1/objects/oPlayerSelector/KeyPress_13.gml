if(currFolderInt = oBattleManager.goalState)
{
	if(oBattleManager.currentDepth = 1)
	{
		room_goto(oBattleSwitcher.original_room);
	} else
	{
		setDefault();
		oBattleManager.currentDepth--; 
		oBattleManager.generateLevel(irandom_range(5,20)); //later modify to scale with difficulty
	}
		
}