// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PlayerDropItem(){
	with (obj_player) 
	{
		global.inst_lifted = noone;
		sprite_idle = spr_player;
		sprite_run = spr_player_run;
	}
}