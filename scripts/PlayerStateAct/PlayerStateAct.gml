function PlayerStateAct(){
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animation_end)
	{
		state = PlayerStateFree;
		animation_end = false;
		if (animation_end_script != -1)
		{
			script_execute(animation_end_script);
			animation_end_script = -1;
		}
	}
}