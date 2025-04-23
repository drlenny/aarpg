function SlimeAttack(){
	
	// How fast to move
	var _spd = enemy_speed;
	
	// Don't move while still getting ready to jump
	if (image_index < 2) _spd = 0;
	
	// Freeze animation while in mid-air and also after landing finishes
	if (floor(image_index) == 3) || (floor(image_index == 5)) image_speed = 0;
	
	// How far we have to jump
	var _distance_to_go = point_distance(x, y, x_to, y_to);
	
	// Begin landing end of the animation once we're nearly done
	if (_distance_to_go < 4) && (image_index < 5) image_speed = 1.0
	
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
		// So the image_index is being tracked correctly, it stop just short of 5 and gets stuck as an integer
		// maybe find a different way to handle this other than using animation frames to determine state machines
		if (image_index >= 4.99)
		{
			state_target = ENEMYSTATE.CHASE;
			image_index = 5;
			state_wait_duration = 15;
			state = ENEMYSTATE.WAIT;
		}
	}
}