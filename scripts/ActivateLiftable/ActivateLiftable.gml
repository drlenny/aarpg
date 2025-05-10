function ActivateLiftable(id){
	// Check if nothing is held
	if (global.inst_lifted == noone)
	{
		PlayerActOutAnimation(spr_player_lift);
		
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