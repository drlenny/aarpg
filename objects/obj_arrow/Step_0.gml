/// @description hit things

if (!global.game_paused)
{
	var _entity = instance_place(x, y, parent_entity);
	var _break = false;
	if (_entity != noone)
	{
		with (_entity)
		{
			// damage enemy
			if (object_is_ancestor(object_index, parent_enemy))
			{
				HurtEnemy(id, 25, other.id, 20);
				_break = true;
			}
			else
			{
				// hit other objects
				if (entity_hit_script != -1)
				{
					script_execute(entity_hit_script);
					_break = true;
				}
			}
		}
		if (_break) instance_destroy();
	}

	// destroy if we leave camera bounds
	var _cam = view_camera[0];
	var _camX = camera_get_view_x(_cam);
	var _camY = camera_get_view_y(_cam);
	if (!point_in_rectangle(x, y, _camX, _camY, _camX + camera_get_view_width(_cam), _camY + camera_get_view_height(_cam)))
	{
		instance_destroy();
	}
}

// stop arrow if game is paused
if (global.game_paused) speed = 0;
else speed = 6;

if (tilemap_get_at_pixel(collision_map, x, y) > 0) instance_destroy();