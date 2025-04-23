function EnemyWait(){
	if (++state_wait >= state_wait_duration)
	{
		state_wait = 0;
		state = state_target;
	}
}