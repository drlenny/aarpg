function PlayerActOutAnimation(sprite, end_script = -1){
	// Carry out an animation and optionally carry out a script when the animation ends
	state =  PlayerStateAct;
	sprite_index = sprite;
	if (end_script != -1) animation_end_script = end_script;
	local_frame = 0;
	image_index = 0;
	PlayerAnimateSprite();
}