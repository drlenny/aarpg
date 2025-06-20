if (!global.game_paused)
{
	image_speed = 1.0;
	// Hit things
	if (image_index < 4)
	{
		var _entity_list = ds_list_create();
		var _entity_count = instance_place_list(x, y, parent_entity, _entity_list, false);
		var _entity = noone;
		while (_entity_count > 0)
		{
			// check to make sure explosion hits each object only once
			_entity = _entity_list[| 0 ];
			if (ds_list_find_index(collision_history, _entity) == -1)
			{
				with(_entity)
				{
					if (object_is_ancestor(object_index, parent_enemy))
					{
						HurtEnemy(id, 25, other.id, 20);
					}
					else
					{
						if (entity_hit_script != -1) script_execute(entity_hit_script);
					}
				}
				ds_list_add(collision_history, _entity);
			}
			ds_list_delete(_entity_list, 0);
			_entity_count--;
		}
		ds_list_destroy(_entity_list);
	}
}
// pause explosion if game is paused
else
{
	image_speed = 0.0;
}