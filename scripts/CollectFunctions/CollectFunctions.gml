// Functions responsible for item collection

function CollectCoins(_amount){
	global.player_money += _amount;
}

function CollectAmmo (_array){
	// array = [type, amount]
	global.player_ammo[_array[0]] += _array[1];
}