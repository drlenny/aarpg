// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function PurchaseItem(_item, _amount, _cost){
	if (global.player_money >= _cost)
	{
		global.player_has_any_items = true;
		global.player_ammo[_item] += _amount;
		global.player_money -= _cost;
		global.player_equipped = _item;
		if (!activate.item_repeatable) instance_destroy(activate);
		
		var _desc = "";
		switch (_item)
		{
			case ITEM.BOW: _desc = "You got a bow!\nFire arrows with the action key\nto damage enemies from a distance!"; break;
			case ITEM.BOMB: _desc = "You got bombs!\nUse the action key to light a bomb\nand throw it for explosive power!"; break; 
			case ITEM.HOOK: _desc = "You got a hook launcher!\nUse the action key to hook things towards you,\nor pull yourself towards a solid target!"; break;
			default: _desc = "No item description found!"; break;
		}
		if (!global.player_item_unlocked[_item]) NewTextBox(_desc, 1);
		global.player_item_unlocked[_item] = true;
	}
	else
	{
		NewTextBox("Not enough money...", 1);
	}
}