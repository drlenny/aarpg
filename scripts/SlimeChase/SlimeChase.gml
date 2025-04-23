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