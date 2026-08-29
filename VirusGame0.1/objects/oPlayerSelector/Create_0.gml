folderUP = -4;
folderDOWN = 6;
folderLEFT = 0;
folderRIGHT = 2;

currentFolder = folderPosition1;
currFolderInt = 1;

function setFolder(change)
{
	folderUP = folderUP + change;
	folderDOWN = folderDOWN + change;
	folderLEFT = folderLEFT + change;
	folderRIGHT = folderRIGHT + change;
	currFolderInt = currFolderInt + change;
	currentFolder = oBattleManager.folderList[currFolderInt - 1];
	
	//movePlayerSelector
	oPlayerSelector.x = currentFolder.x;
	oPlayerSelector.y = currentFolder.y;
}

function setDefault()
{
	folderUP = -4;
	folderDOWN = 6;
	folderLEFT = 0;
	folderRIGHT = 2;
	currentFolder = folderPosition1;
	currFolderInt = 1;
	
	//movePlayerSelector
	oPlayerSelector.x = currentFolder.x;
	oPlayerSelector.y = currentFolder.y;
}