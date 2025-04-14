function PlayerThrow(){
	with (global.inst_lifted)
	{
		lifted = false;
		persistent = false;
		thrown = true;
		z = CARRY_HEIGHT;
		throw_peak_height = z + 10;
		throw_distance = entity_throw_distance;
		throw_distance_travelled = 0;
		throw_start_percent = (CARRY_HEIGHT / throw_peak_height) * 0.5;
		throw_percent = throw_start_percent;
		direction = other.direction;
		xstart = x;
		ystart = y;
	}
	PlayerActOutAnimation(spr_player_lift);
	global.inst_lifted = noone;
}