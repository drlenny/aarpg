function SaveGame(){

// Create save map
var _map = ds_map_create();

_map[? "room"] = room;
_map[? "player_health"] = global.player_health;
_map[? "player_health_max"] = global.player_health_max;
_map[? "player_money"] = global.player_money;
_map[? "player_item_unlocked"] = global.player_item_unlocked;
_map[? "player_ammo"] = global.player_ammo;
_map[? "player_equipped"] = global.player_equipped;
_map[? "player_has_any_items"] = global.player_has_any_items;
_map[? "target_x"] = global.target_x;
_map[? "target_y"] = global.target_y;

var _quest_map = ds_map_create();
ds_map_copy(_quest_map, global.quest_status);
ds_map_add_map(_map, "quest_status", _quest_map);

// Save all of this to a string
var _string = json_encode(_map);
SaveStringToFile("save" + string(global.game_save_slot) + ".sav", _string);
show_debug_message(_string);

// Nuke the data
ds_map_destroy(_map);
show_debug_message("Game saved!");

}

function SaveStringToFile(_filename, _string)
{
	var _buffer = buffer_create(string_byte_length(_string)+1, buffer_fixed, 1);
	buffer_write(_buffer, buffer_string, _string);
	buffer_save(_buffer, _filename);
	buffer_delete(_buffer);
}