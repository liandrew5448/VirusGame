//create list of folders
folderList = [folderPosition1, folderPosition2, folderPosition3, folderPosition4, folderPosition5,
			folderPosition6, folderPosition7, folderPosition8, folderPosition9, folderPosition10,
			folderPosition11, folderPosition12, folderPosition13, folderPosition14, folderPosition15,
			folderPosition16, folderPosition17, folderPosition18, folderPosition19, folderPosition20];

maxFolders = oGameManager.levelDifficulty[0];
currentState = oGameManager.levelDifficulty;

//depth, folder #,
goalFolder = [irandom(maxFolders),]; 

function generateLevel()
{
	oPlayerSelector.x = folderPosition1.x;
	oPlayerSelector.y = folderPosition1.y;
	
	show_debug_message("===== FOLDER GENERATION =====");
	
	//implimenting the folder generation
	for(var i = 0; i < currentState[0]; i++)
	{
		instance_create_layer(folderList[i].x, folderList[i].y, "Instances",oFolder);
		show_debug_message("Creating folder " + string(i + 1));
	}

}

generateLevel();