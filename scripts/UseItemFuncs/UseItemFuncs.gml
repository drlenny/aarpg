function UseItemBomb(){
	if (global.player_ammo[ITEM.BOMB] > 0)
	{
		global.player_ammo[ITEM.BOMB]--;
		var _bomb = instance_create_layer(x, y, "Instances", obj_bomb);
		ActivateLiftable(_bomb);
	}
}

function UseItemBow(){
	if (global.player_ammo[ITEM.BOW] > 0)
	{
		global.player_ammo[ITEM.BOW]--;
		PlayerActOutAnimation(spr_player_bow, PlayerFireArrow);
	}
}


function PlayerFireArrow(){
	with (instance_create_depth(floor(x), floor(y) - 7, depth, obj_arrow))
	{
		direction = other.direction;
		direction = CARDINAL_DIR * 90;
		image_speed = 0;
		image_index = CARDINAL_DIR;
		speed = 6;
	}
}


function UseItemHook(){

}