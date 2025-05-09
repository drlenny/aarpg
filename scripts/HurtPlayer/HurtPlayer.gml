function HurtPlayer(_direction, _force, _damage){
	
	// check if player is invulnerable
	if (obj_player.invulnerable <= 0)
	{
		// reduce player health by determined amount without dropping below 0
		global.player_health = max(0, global.player_health - _damage);
		
		// check if health is greater than 0
		if (global.player_health > 0)
		{
			with (obj_player) 
			{
				state = PlayerStateBonk;
				direction = _direction - 180;
				move_distance_remaining = _force;
				ScreenShake(2, 10);
				flash = 0.7;
				invulnerable = 60;
				flash_shader = sh_red_flash;
			}
		}
		else
		{
			// kill the player
		}
	}
}