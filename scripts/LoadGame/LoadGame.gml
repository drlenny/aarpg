function LoadGame(_slot)
{
	global.game_save_slot = _slot;
	var _file = "save" + string(global.game_save_slot) + ".sav";
	if (file_exists(_file))
	{
		// Load game data
		var _json = LoadJSONFromFile(_file);
		
		// global variables
		global.player_health = _json[? "player_health"];
		global.player_health_max = _json[? "player_health_max"];
		global.player_money = _json[? "player_money"];
		global.player_equipped = _json[? "player_equipped"];
		global.player_has_any_items = _json[? "player_has_any_items"];
		global.target_x = _json[? "target_x"];
		global.target_y = _json[? "target_y"];
		
		// lists to arrays
		for (var i = 0; i < ITEM.TYPE_COUNT; i++)
		{
			// note to self: use '?' for looking for item in ds_map and use '|' for looking for item in ds_list
			global.player_item_unlocked[i] = _json[? "player_item_unlocked"][| i];
			global.player_ammo[i] = _json[? "player_ammo"][| i];
		}
		
		// quest data
		ds_map_copy(global.quest_status, _json[? "quest_status"]);
		
		// room
		RoomTransition(TRANS_TYPE.SLIDE, _json[? "room"]);
		ds_map_destroy(_json);
		
		return true;
	}
	else
	{
		show_debug_message("no save in this slot");
		return false;
	}
}

function LoadJSONFromFile(_filename)
{
	var _buffer = buffer_load(_filename);
	var _string = buffer_read(_buffer, buffer_string);
	buffer_delete(_buffer);
	
	var _json = json_decode(_string);
	return _json;
}