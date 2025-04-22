event_inherited();

// Intrinsic variables
state = ENEMYSTATE.IDLE;
h_speed = 0;
v_speed = 0;
x_to = xstart;
y_to = ystart;
dir = 0;
time_passed = 0;
wait_duration = 60;
wait = 0;
aggro_check = 0;
aggro_check_duration = 5;
aggro_drop = 0;
aggro_drop_duration = 120;


// Enemy Sprites
spr_move = spr_slime_enemy;

// Enemy Functions
enemy_script[ENEMYSTATE.IDLE] = -1;
enemy_script[ENEMYSTATE.WANDER] = -1;
enemy_script[ENEMYSTATE.CHASE] = -1;
enemy_script[ENEMYSTATE.ATTACK] = -1;
enemy_script[ENEMYSTATE.HURT] = -1;
enemy_script[ENEMYSTATE.DIE] = -1;
enemy_script[ENEMYSTATE.WAIT] = -1;