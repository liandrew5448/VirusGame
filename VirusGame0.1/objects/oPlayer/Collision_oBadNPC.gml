if (instance_exists(oBattleSwitcher)) exit;

var _switcher = instance_create_depth(0,0,0, oBattleSwitcher);
_switcher.player_data = id;
_switcher.enemy_data = other.id;
_switcher.original_room = room;

// Move the player slightly away from the NPC so they aren't stuck together on return
x -= sign(other.x - x) * 8;
y -= sign(other.y - y) * 8;

room_goto(TestBattle);