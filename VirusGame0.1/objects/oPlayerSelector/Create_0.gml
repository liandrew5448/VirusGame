folderUP = -3;
folderDOWN = 5;
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
	currentFolder = currentFolder + change;
}

function setDefault()
{
	folderUP = -3;
	folderDOWN = 5;
	folderLEFT = 0;
	folderRIGHT = 2;
	currentFolder = folderPosition1;
	currFolderInt = 1;
}