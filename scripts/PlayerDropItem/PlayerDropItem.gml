function PlayerDropItem(){
	with (obj_player) 
	{
		global.inst_lifted = noone;
		sprite_idle = spr_player;
		sprite_run = spr_player_run;
	}
}