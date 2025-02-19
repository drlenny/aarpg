// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
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
	if(key_attack)
	{
		state = PlayerStateAttack;
		state_attack = AttackSlash;
	}

	// Activate Key Logic
	if (key_activate)
	{
		// 1. Check for an entity to activate
		// 2. If there is nothing, or there is something but it has no script - Roll!
		// 3. Otherwise, there is something and it has a script! Activate!
		// 4. If the thing we activate is an NPC, make it face toward self
		
		// Step 1
		var _activate_x = lengthdir_x(10, direction);
		var _activate_y = lengthdir_y(10, direction);
		activate = instance_position(x + _activate_x, y + _activate_y, parent_entity);
		
		// Step 2
		if (activate == noone || activate.entity_activate_script == -1)
		{
			state = PlayerStateRoll;
			move_distance_remaining = distance_roll;
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