if (instance_exists(oBattleSwitcher)) exit;

var _switcher = instance_create_depth(0,0,0, oBattleSwitcher);
_switcher.player_data = id;
_switcher.enemy_data = other.id;
_switcher.original_room = room;

instance_destroy(oBadNPC);
oGameManager.difficulty = 5;
room_goto(TestBattle);