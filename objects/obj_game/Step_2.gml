/// @description Pause the Game

if (keyboard_check_pressed(vk_escape)) 
&& (global.text_box == false) 
&& (global.room_transition == false)
&& (obj_player.state != PlayerStateDead)
{
	global.game_paused = !global.game_paused;
	
	if (global.game_paused)
	{
		with (all)
		{
			ContinueGame();
		}
	}
	else
	{
		with (all)
		{
			image_speed = game_paused_image_speed;
		}
	}
	
	
	
}