if (global.game_paused)
{
	var _key_up = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
	var _key_down = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
	pause_option_selected += (_key_down - _key_up);
	if (pause_option_selected >= array_length(pause_option)) pause_option_selected = 0;
	if (pause_option_selected < 0) pause_option_selected = array_length(pause_option) - 1;
	
	var _key_activate = keyboard_check_pressed(vk_space);
	if (_key_activate)
	{
		switch (pause_option_selected)
		{
			case 0: // Continue
			{
				global.game_paused = false;
				with (all) ContinueGame();
			} 
			break;
			case 1: // Save and quit
			{
				with (obj_game) instance_destroy();
				SaveGame();
				game_restart();
			}
			break;
			case 2: // Save and quit to desktop
			{
				SaveGame();
				game_end();
			}
			break;
		}
	}
}