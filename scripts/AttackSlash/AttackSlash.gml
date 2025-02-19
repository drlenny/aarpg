// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function AttackSlash(){
	if(sprite_index != spr_player_attack_slash)
	{
		sprite_index = spr_player_attack_slash;
		local_frame = 0;
		image_index = 0;
	}
	
	// Update Sprite
	PlayerAnimateSprite();
	
	if (animation_end)
	{
		state = PlayerStateFree;
		animation_end = false;
	}
}