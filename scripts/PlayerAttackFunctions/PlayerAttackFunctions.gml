function AttackSlash(){
	// Attack Just Started
	if(sprite_index != spr_player_attack_slash)
	{
		// Set up correct animation
		sprite_index = spr_player_attack_slash;
		local_frame = 0;
		image_index = 0;
		
		// Clear Hit List
		if (!ds_exists(hit_by_attack, ds_type_list)) hit_by_attack = ds_list_create();
		ds_list_clear(hit_by_attack);
	}
	
	CalcAttack(spr_player_attack_slash_HB);
	
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animation_end)
	{
		state = PlayerStateFree;
		animation_end = false;
	}
}

function AttackSpin(){

}

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
					if (object_is_ancestor(object_index, parent_enemy))
					{
						HurtEnemy(id, 5, other.id, 10);
					}
					else if(entity_hit_script != -1) script_execute(entity_hit_script);
				}
			}
		}
	}
	
	ds_list_destroy(_hit_by_attack_now);
	mask_index = spr_player;
}

// Damage Enemy
function HurtEnemy(_enemy, _damage, _source, _knockback){
	with (_enemy)
	{
		if (state != ENEMYSTATE.DIE)
		{
			enemy_HP -= _damage;
			flash = 1;
			
			// Hurt or dead?
			// Dead
			if (enemy_HP <= 0)
			{
				state = ENEMYSTATE.DIE;
			}
			// Hurt
			else
			{
				if (state != ENEMYSTATE.HURT) state_previous = state;
				state = ENEMYSTATE.HURT;
			}
			
			// Knockback
			image_index = 0;
			if (_knockback != 0)
			{
				var _knock_direction = point_direction(x, y, (_source).x, (_source).y);
				x_to = x - lengthdir_x(_knockback, _knock_direction);
				y_to = y - lengthdir_y(_knockback, _knock_direction);
			}
			
		}
	}
}