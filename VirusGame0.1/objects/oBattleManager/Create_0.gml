
//create list of folders
folderList = [folderPosition1, folderPosition2, folderPosition3, folderPosition4, folderPosition5,
			folderPosition6, folderPosition7, folderPosition8, folderPosition9, folderPosition10,
			folderPosition11, folderPosition12, folderPosition13, folderPosition14, folderPosition15,
			folderPosition16, folderPosition17, folderPosition18, folderPosition19, folderPosition20];


//implimenting the folder generation
for(var i = 0; i < oGameManager.difficulty; i++)
{
	instance_create_layer(folderList[i].x, folderList[i].y, "Instances",oFolder);
	folderList[i].active = true;
}

oPlayerSelector.x = folderPosition1.x;
oPlayerSelector.y = folderPosition1.y;

var maxFolders = oGameManager.difficulty;