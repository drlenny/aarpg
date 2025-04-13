function ActivateLiftable(id){
	if (global.inst_lifted == noone)
	{
		PlayerActOutAnimation(spr_player_lift);
		
		global.inst_lifted = id;
		with (global.inst_lifted)
		{
			lifted = true;
			persistent = true;
		}
	}
}