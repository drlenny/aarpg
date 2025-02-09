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
	
	// Change State
	if (key_activate)
	{
		state = PlayerStateRoll;
		move_distance_remaining = distance_roll;
	}
}