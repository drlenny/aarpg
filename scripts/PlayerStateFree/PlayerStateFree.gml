function PlayerStateFree(){
	// Movement
	h_speed = lengthdir_x(input_magnitude * speed_walk, input_direction);
	v_speed = lengthdir_y(input_magnitude * speed_walk, input_direction);

	PlayerCollision();

	// Update Sprite Index
	var _old_sprite = sprite_index;
	if (input_magnitude != 0)
	{
		direction = input_direction;
		sprite_index = sprite_run;
	} else sprite_index = sprite_idle;
	if (_old_sprite != sprite_index) local_frame = 0;

	// Update Image Index
	PlayerAnimateSprite();
	
	// Attack Key Logic
	
	if(key_attack) && (global.inst_lifted == noone) // checks if an item is held
	{
		state = PlayerStateAttack;
		state_attack = AttackSlash;
	}

	// Activate Key Logic
	if (key_activate)
	{
		// 1. Check for an entity to activate
		// 2. If there is nothing, or there is something but it has no script - Roll!
			// 2a. If we are carrying something, throw it!
			// 2b. Otherwise, roll!
		// 3. Otherwise, there is something and it has a script! Activate!
		// 4. If the thing we activate is an NPC, make it face toward self.
		
		// Step 1
		var _activate_x = x + lengthdir_x(10, direction);
		var _activate_y = y + lengthdir_y(10, direction);
		
		var _activate_size = 4;
		var _activate_list = ds_list_create();
		activate = noone;
		var _entities_found = collision_rectangle_list(
			_activate_x - _activate_size,
			_activate_y - _activate_size,
			_activate_x + _activate_size,
			_activate_y + _activate_size,
			parent_entity,
			false,
			true,
			_activate_list,
			true
		)
		
		// if the first instance we find is either our lifted entity or it has no script, try the next one
		while (_entities_found > 0)
		{
			var _check = _activate_list[| --_entities_found];
			if (_check != global.inst_lifted) && (_check.entity_activate_script != -1)
			{
				activate = _check;
				break;
			}
		}
		
		ds_list_destroy(_activate_list);
		
		// Step 2
		if (activate == noone)
		{
			// Throw something if held, otherwise roll
			if (global.inst_lifted != noone)
			{
				PlayerThrow();
			}
			else
			{
				state = PlayerStateRoll;
				move_distance_remaining = distance_roll;
			}
		}
		else
		{
			// Step 3
			script_execute_ext(activate.entity_activate_script, activate.entity_activate_args);
			
			// Step 4
			if (activate.entity_npc)
			{
				with (activate)
				{
					direction = point_direction(x, y, other.x, other.y);
					image_index = CARDINAL_DIR;
				}
			}
		}
		
	}
}