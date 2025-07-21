function SlimeWander(){
	sprite_index = spr_move;
	
	// At destination or given up?
	if ((x == x_to) && (y == y_to)) || (time_passed > enemy_wander_distance / enemy_speed)
	{
		h_speed = 0;
		v_speed = 0;
		// End our move animation
		if (image_index < 1)
		{
			image_speed = 0.0;
			image_index = 0;
		}
		
		// Set new target destination
		if (++wait >= wait_duration)
		{
			wait = 0;
			time_passed = 0;
			dir = point_direction(x, y, xstart, ystart) + irandom_range(-45, 45);
			x_to = x + lengthdir_x(enemy_wander_distance, dir);
			y_to = y + lengthdir_y(enemy_wander_distance, dir);
		}
	}
	// Move towards new destination
	else 
	{
		time_passed++;
		image_speed = 1.0;
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		var _speed_this_frame = enemy_speed;
		if (_distance_to_go < enemy_speed) _speed_this_frame = _distance_to_go;
		dir = point_direction(x,y,x_to,y_to);
		h_speed = lengthdir_x(_speed_this_frame, dir);
		v_speed = lengthdir_y(_speed_this_frame, dir);
		// face sprite towards movement direction
		if (h_speed != 0) image_xscale = sign(h_speed);
		
		// Collide and move
		var _collided = EnemyTileCollision();
	}
	
	// Check for aggro
	if (++aggro_check >= aggro_check_duration)
	{
		aggro_check = 0;
		if (instance_exists(obj_player)) && (point_distance(x, y, obj_player.x, obj_player.y) <= enemy_aggro_radius) && (obj_player.state != PlayerStateDead)
		{
			state = ENEMYSTATE.CHASE;
			target = obj_player;
		}
	}
}

function SlimeChase(){
	sprite_index = spr_move;
	
	if (instance_exists(target))
	{
		x_to = target.x;
		y_to = target.y;
		
		var _distance_to_go = point_distance(x, y, x_to, y_to);
		image_speed = 1.0;
		dir = point_direction(x, y, x_to, y_to);
		if (_distance_to_go > enemy_speed)
		{
			h_speed = lengthdir_x(enemy_speed, dir);
			v_speed = lengthdir_y(enemy_speed, dir);
		}
		else
		{
			h_speed = lengthdir_x(_distance_to_go, dir);
			v_speed = lengthdir_y(_distance_to_go, dir);
		}
		if (h_speed != 0) image_xscale = sign(h_speed);
		
		// Collide and Move
		EnemyTileCollision();
		
		// Drop aggro if player is far enough away for long enough
		if (point_distance(x, y, obj_player.x, obj_player.y) > enemy_aggro_radius * 2) && (++aggro_drop >= aggro_drop_duration)
		{
			aggro_drop = 0;
			state = ENEMYSTATE.WANDER;
		}
		
		// Check if close enough to launch an attack
		if (point_distance(x, y, target.x, target.y) <= enemy_attack_radius)
		{
			state = ENEMYSTATE.ATTACK;
			sprite_index = spr_attack;
			image_index = 0;
			image_speed = 1.0;
			// target 8px past the player
			x_to += lengthdir_x(8, dir);
			y_to += lengthdir_y(8, dir);
		}
	}
	

	
}

function SlimeAttack(){
	
	// How fast to move
	var _spd = enemy_speed;
	
	// Don't move while still getting ready to jump
	if (image_index < 2) _spd = 0;
	
	// Freeze animation while in mid-air and also after landing finishes
	if (floor(image_index) == 3) || (floor(image_index) == 5) image_speed = 0;
	
	// How far we have to jump
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	
	// Begin landing end of the animation once we're nearly done
	if (_distance_to_go < 4) && (image_index < 5) image_speed = 1.0;
	
	// Move 
	if (_distance_to_go > _spd)
	{
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(_spd, dir);
		v_speed = lengthdir_y(_spd, dir);
		if (h_speed != 0) image_xscale = sign(h_speed);
		
		// Commit to move and stop moving if we hit a wall
		if (EnemyTileCollision() == true)
		{
			x_to = x;
			y_to = y;
		}
	}
	// Jump and land where aiming
	else
	{
		x = x_to;
		y = y_to;
		
		if (floor(image_index) == 5)
		{
			if (obj_player.state != PlayerStateDead)
			{
				state_target = ENEMYSTATE.CHASE;
			}
			else state_target = ENEMYSTATE.WANDER;
			
			state_wait_duration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}
	
function SlimeHurt(){
	sprite_index = spr_hurt;
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	if (_distance_to_go > enemy_speed)
	{
		image_speed = 1.0;
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(enemy_speed, dir);
		v_speed = lengthdir_y(enemy_speed, dir);
		if (h_speed != 0) image_xscale = -sign(h_speed);
		
		// Collide and move, if there is a collision, stop knockback
		if (EnemyTileCollision())
		{
			x_to = x;
			y_to = y;
		}
	}
	else
	{
		x = x_to;
		y = y_to;
		if (state_previous != ENEMYSTATE.ATTACK) state = state_previous;
		else state = ENEMYSTATE.CHASE;
		
		// Collide and move, if there is a collision, stop knockback
		if (EnemyTileCollision())
		{
			x_to = x;
			y_to = y;
		}
	}
	
}
	
function SlimeDie(){
	sprite_index = spr_die;
	image_speed = 1.0;
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	if (_distance_to_go > enemy_speed)
	{
		dir = point_direction(x, y, x_to, y_to);
		h_speed = lengthdir_x(enemy_speed, dir);
		v_speed = lengthdir_y(enemy_speed, dir);
		if (h_speed != 0) image_xscale = -sign(h_speed);
		
		// Collide and move
		EnemyTileCollision();
	}
	else
	{
		x = x_to;
		y = y_to;
	}
	
	if (image_index + (sprite_get_speed(sprite_index) / game_get_speed(gamespeed_fps)) >= image_number)
	{
		instance_destroy();
	}
}