/// @description Entity Loop

if (!global.game_paused)
{
	depth = -bbox_bottom;
	if (lifted) && (instance_exists(obj_player))
	{
		if (obj_player.sprite_index != spr_player_lift)
		{
			x = obj_player.x
			y = obj_player.y
			z = 13;
			depth = obj_player.depth - 1;
		}
	}
}
flash = max(flash - 0.04, 0);