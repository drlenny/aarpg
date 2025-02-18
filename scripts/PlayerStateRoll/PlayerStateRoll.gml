function PlayerStateRoll(){
	// Movement
	h_speed = lengthdir_x(speed_roll, direction);
	v_speed = lengthdir_y(speed_roll, direction);
	
	move_distance_remaining = max(0, move_distance_remaining - speed_roll);
	var _collided = PlayerCollision();
	
	// Update Sprite
	sprite_index = sprite_roll;
	var _total_frames = sprite_get_number(sprite_index) / 4;
	image_index = (CARDINAL_DIR * _total_frames) + min(((1 - (move_distance_remaining / distance_roll)) * _total_frames), _total_frames - 1);
	
	// Change State
	if (move_distance_remaining <= 0)
	{
		state = PlayerStateFree;
	}
	
	if (_collided)
	{
		state = PlayerStateBonk;
		move_distance_remaining = distance_bonk;
		ScreenShake(4, 25);
	}
}