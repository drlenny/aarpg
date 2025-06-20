event_inherited();

if (!global.game_paused)
{
	// bomb timer ticks down
	bomb_tick--;
	if (bomb_tick == 0)
	{
		flash = 0.75;
		bomb_stage++;
		bomb_tick = bomb_tick_rate[bomb_stage];
	}
	
	// bomb explodes
	if (bomb_tick < 0)
	{
		// force bomb onto floor in case it is midair when it blows
		y -= z;
		if (lifted)
		{
			PlayerDropItem();
		}
		instance_destroy();
	}
}