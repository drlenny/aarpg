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
	}
}