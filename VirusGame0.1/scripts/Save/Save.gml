global.is_loading_from_file = false;

function SaveRoom() {

	var friendlyNPCCount = instance_number(oFriendlyNPC);
	var badNPCCount = instance_number(oBadNPC)
	//add everything you need here
	var roomStruct = {
		
		friendlyNPC : friendlyNPCCount,
		badNPC : badNPCCount,
		friendlyNPCData : array_create(friendlyNPCCount),
		badNPCData : array_create(badNPCCount),
	}
	
	//npcs
	for (var i = 0; i < friendlyNPCCount; i++) {
		var j = instance_find(oFriendlyNPC, i);
		
		roomStruct.friendlyNPCData[i] = {
			x : j.x,
			y : j.y,
		}
	}
	
	for (var i = 0; i < badNPCCount; i++) {
		var j = instance_find(oBadNPC, i);
		
		roomStruct.badNPCData[i] = {
			x : j.x,
			y : j.y,
		}
	}
	
	if room == Testroom {global.levelData.testRoom = roomStruct;};
	if room == TestBattle {global.levelData.testBattle = roomStruct;};
}

function LoadRoom() {
	var roomStruct = 0;
	
	if room == Testroom {roomStruct = global.levelData.testRoom;};
	if room == TestBattle {roomStruct = global.levelData.testBattle;};
	
	if !is_struct(roomStruct) {exit;};
	
	with (oFriendlyNPC) instance_destroy();
	
	for (var i = 0; i < roomStruct.friendlyNPC; i++) {
		instance_create_depth(roomStruct.friendlyNPCData[i].x, roomStruct.friendlyNPCData[i].y, layer, oFriendlyNPC);
	}
	
	with (oBadNPC) instance_destroy();
	
	for (var i = 0; i < roomStruct.badNPC; i++) {
		instance_create_depth(roomStruct.badNPCData[i].x, roomStruct.badNPCData[i].y, layer, oBadNPC);
	}
	
}
	
function SaveGame(fileNum = 0) {
	var saveArray = array_create(0);
	
	global.statData.save_x = oPlayer.x;
	global.statData.save_y = oPlayer.y;
	global.statData.save_rm = room_get_name(global.last_game_room);
	
	global.statData.active_npc = global.active_npc;
	
	array_push(saveArray, global.statData);
	
	array_push(saveArray, global.levelData);
	
	var fileName = "savedata" + string(fileNum) + ".sav";
	var json = json_stringify(saveArray);
	
	var buffer = buffer_create(string_byte_length(json) + 1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, json);
	buffer_save(buffer, fileName);
	buffer_delete(buffer);
}
	
function LoadGame(fileNum = 0) {
	var fileName = "savedata" + string(fileNum) + ".sav";
	if !file_exists(fileName) exit;
	
	var buffer = buffer_load(fileName);
	var json = buffer_read(buffer, buffer_string);
	buffer_delete(buffer);
	
	var loadArray = json_parse(json);
	
	global.statData = array_get(loadArray, 0);
	global.levelData = array_get(loadArray, 1);
	
	global.active_npc = global.statData.active_npc;
	global.is_loading_from_file = true;
	
	var loadRoom = asset_get_index(global.statData.save_rm);
	room_goto(loadRoom);
	
	if instance_exists(oPlayer) { instance_destroy(oPlayer); };
	instance_create_depth(global.statData.save_x, global.statData.save_y, layer, oPlayer);
		
	LoadRoom();
	
	
}