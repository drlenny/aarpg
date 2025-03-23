function PlayerCollision(){
	var _collision = false;
	var _entity_list = ds_list_create();
	
	
	// Horizontal Tiles
	if (tilemap_get_at_pixel(collision_map, x + h_speed, y))
	{
		x -= x mod TILE_SIZE;
		if (sign(h_speed) == 1) x += TILE_SIZE - 1;
		h_speed = 0;
		_collision = true;
	}
	
	// Horizontal Entities
	var _entity_count = instance_position_list(x + h_speed, y, parent_entity, _entity_list, false);
	var _snapX;
	while (_entity_count > 0)
	{
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collision ==  true)
		{
			// Move as close as we can
			if (sign(h_speed) == -1) _snapX = _entity_check.bbox_right + 1;
			else _snapX = _entity_check.bbox_left - 1;
			x = _snapX
			h_speed = 0;
			_collision = true;
			_entity_count = 0;
		}
		ds_list_delete(_entity_list, 0);
		_entity_count--;
	}
	
	// Horizontal Move Commit
	x += h_speed;
	
	// Clear list between axis
	ds_list_clear(_entity_list);
	
	// Vertical Tiles
	if (tilemap_get_at_pixel(collision_map, x, y + v_speed))
	{
		y -= y mod TILE_SIZE;
		if (sign(v_speed) == 1) y += TILE_SIZE - 1;
		v_speed = 0;
		_collision = true;
	}
	
	// Vertical Entities
	var _entity_count = instance_position_list(x, y + v_speed, parent_entity, _entity_list, false);
	var _snapY;
	while (_entity_count > 0)
	{
		var _entity_check = _entity_list[| 0];
		if (_entity_check.entity_collision ==  true)
		{
			// Move as close as we can
			if (sign(v_speed) == -1) _snapY = _entity_check.bbox_bottom + 1;
			else _snapY = _entity_check.bbox_top - 1;
			y = _snapY
			v_speed = 0;
			_collision = true;
			_entity_count = 0;
		}
		ds_list_delete(_entity_list, 0);
		_entity_count--;
	}
	
	// Vertical Move Commit
	y += v_speed;
	
	ds_list_destroy(_entity_list);
	
	return _collision
}