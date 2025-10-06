// execute state machine
if (!global.game_paused) && (!global.dialogue_sequence)
{
	if (enemy_script[state] != -1) script_execute(enemy_script[state]);
	depth = -bbox_bottom;
}