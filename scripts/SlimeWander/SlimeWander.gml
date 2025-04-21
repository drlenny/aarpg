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
		if (instance_exists(obj_player)) && (point_distance(x, y, obj_player.x, obj_player.y) <= enemy_aggro_radius)
		{
			state = ENEMYSTATE.CHASE;
			target = obj_player;
		}
	}
}