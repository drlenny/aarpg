function PlayerStateHook(){
	h_speed = 0;
	v_speed = 0;
	
	// If just arrived in the hook state
	if (sprite_index != spr_player_hook)
	{
		hook = 0;
		hook_x = 0;
		hook_y = 0;
		hook_status = HOOK_STATUS.EXTENDING;
		hooked_entity = noone;
		
		// Update the sprite
		sprite_index = spr_player_hook;
		image_index = CARDINAL_DIR;
		image_speed = 0;
	}
	
	// Extend and retract hook
	var _speed_hook_temp = speed_hook;
	if (hook_status != HOOK_STATUS.EXTENDING) _speed_hook_temp *= -1;
	hook += _speed_hook_temp;
	switch (image_index)
	{
		case 0: hook_x = hook; break;
		case 1: hook_y = -hook; break;
		case 2: hook_x = -hook; break;
		case 3: hook_y = hook; break;
	}
	
	// Hookshot state machine!
	switch (hook_status)
	{
		case HOOK_STATUS.EXTENDING:
		{
			// finish extending
			if (hook >= distance_hook) hook_status = HOOK_STATUS.MISSED;
			
			// check for a hit
			var _hook_hit = collision_circle(x + hook_x, y + hook_y, 4, parent_entity, false, true);
			if (_hook_hit != noone) && (global.inst_lifted != _hook_hit)
			{
				// act depending on what is hit
				switch (_hook_hit.entity_hookable)
				{
					default: // not hookable entity
					{
						// ...else potentially harm entity
						if (object_is_ancestor(_hook_hit.object_index, parent_enemy))
						{
							HurtEnemy(_hook_hit, 1, id, 5);
							hook_status = HOOK_STATUS.MISSED;
						}
						else
						{
							if (_hook_hit.entity_hit_script != -1)
							{
								with (_hook_hit) script_execute(entity_hit_script);
								hook_status = HOOK_STATUS.MISSED;
							}
						}
						
						// ** Add some tile collision later if the tutorial doesn't already do so **
						
					} break;
					// set status to pull entity to player
					case 1:
					{
						hook_status = HOOK_STATUS.PULL_TO_PLAYER;
						hooked_entity = _hook_hit;
					} break;
					// set status to pull player to entity
					case 2:
					{
						hook_status = HOOK_STATUS.PULL_TO_ENTITY;
						hooked_entity = _hook_hit;
					} break;
				}
			}
		} break;
		
		// Pull the entity toward the hooked player
		case HOOK_STATUS.PULL_TO_PLAYER:
		{
			with (hooked_entity)
			{
				x = other.x + other.hook_x;
				y = other.y + other.hook_y;
			}
		} break;
		
		// Pull the player towards the hooked entity
		case HOOK_STATUS.PULL_TO_ENTITY:
		{
			switch (image_index)
			{
				case 0: x += speed_hook; break;
				case 1: y -= speed_hook; break;
				case 2: x -= speed_hook; break;
				case 3: y += speed_hook; break;
			}
		} break;
	}
	
	// Finish retract and end state
	if (hook <= 0)
	{
		hooked_entity = noone;
		state = PlayerStateFree;
	}
}