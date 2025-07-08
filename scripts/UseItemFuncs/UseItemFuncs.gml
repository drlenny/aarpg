function UseItemBomb(){
	if (global.player_ammo[ITEM.BOMB] > 0) && (global.inst_lifted == noone)
	{
		global.player_ammo[ITEM.BOMB]--;
		var _bomb = instance_create_layer(x, y, "Instances", obj_bomb);
		ActivateLiftable(_bomb);
	}
}

function UseItemBow(){

}

function UseItemHook(){

}