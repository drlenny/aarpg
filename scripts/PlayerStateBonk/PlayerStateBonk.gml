function PlayerStateBonk(){
	// Movement
	h_speed = lengthdir_x(speed_bonk, direction - 180);
	v_speed = lengthdir_y(speed_bonk, direction - 180);
	
	move_distance_remaining = max(0, move_distance_remaining - speed_bonk);
	var _collided = PlayerCollision();
	
	// Update Sprite
	sprite_index = spr_player_hurt;
	image_index = CARDINAL_DIR + 2;
	
	// Change Height
	z = sin(((move_distance_remaining / distance_bonk) * pi)) * distance_bonk_height;

	// Change State
	if (move_distance_remaining <= 0)
	{
		state = PlayerStateFree;
	}
}