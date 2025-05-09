function PlayerActOutAnimation(_sprite, _end_script = -1){
	// Carry out an animation and optionally carry out a script when the animation ends
	state =  PlayerStateAct;
	sprite_index = _sprite;
	if (_end_script != -1) animation_end_script = _end_script;
	local_frame = 0;
	image_index = 0;
	PlayerAnimateSprite();
}