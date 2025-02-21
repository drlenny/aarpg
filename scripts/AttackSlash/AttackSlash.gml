function AttackSlash(){
	// Attack Just Started
	if(sprite_index != spr_player_attack_slash)
	{
		// Set up correct animation
		sprite_index = spr_player_attack_slash;
		local_frame = 0;
		image_index = 0;
		
		// Clear Hit List
		if (!ds_exists(hit_by_attack, ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	CalcAttack(spr_player_attack_slash_HB);
	
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animation_end)
	{
		state = PlayerStateFree;
		animation_end = false;
	}
}