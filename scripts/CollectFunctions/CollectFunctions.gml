// Functions responsible for item collection

function CollectCoins(_amount){
	global.player_money += _amount;
}

function CollectAmmo (_array){
	// array = [type, amount]
	if (global.player_ammo[ITEM.BOMB] < global.player_ammo_max)
	{
		global.player_ammo[_array[0]] += _array[1];
	}
}