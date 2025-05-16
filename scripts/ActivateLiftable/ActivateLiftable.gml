function ActivateLiftable(id){
	// Check if nothing is held
	if (global.inst_lifted == noone)
	{
		PlayerActOutAnimation(spr_player_lift);
		
		// set player sprites to carrying item
		sprite_idle = spr_player_carry;
		sprite_run = spr_player_run_carry;
		
		global.inst_lifted = id;
		// Lift item
		with (global.inst_lifted)
		{
			lifted = true;
			persistent = true;
		}
	}
	// Throw the already held item
	else
	{
		PlayerThrow();
	}
}