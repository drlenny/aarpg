function CalcAttack(){
	// Use attack hitbox and check for hits
	mask_index = argument0;
	var _hit_by_attack_now = ds_list_create();
	var _hits = instance_place_list(x, y, parent_entity, _hit_by_attack_now, false);
	if(_hits > 0)
	{
		for (var i = 0; i < _hits; i++)
		{
			// if this instance has not yet been hit by this attack, hit it!
			var _hit_ID = _hit_by_attack_now[| i];
			if (ds_list_find_index(hit_by_attack, _hit_ID) == -1)
			{
				ds_list_add(hit_by_attack, _hit_ID);
				with (_hit_ID)
				{
					image_blend = c_red;
				}
			}
		}
	}
	
	ds_list_destroy(_hit_by_attack_now);
	mask_index = spr_player;
}