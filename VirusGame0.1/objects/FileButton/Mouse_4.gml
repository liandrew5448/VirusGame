// Inherit the parent event
event_inherited();

if (global.save_choose) {
	SaveGame(fileSlot);
	global.save_choose = false;
	global.last_game_room = global.prev_room;
}

if (global.load_choose) {
	LoadGame(fileSlot);
	global.load_choose = false;
	global.last_game_room = global.prev_room;
}