// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER

// Enemy sprites
spr_move = spr_bat_enemy;
spr_attack = spr_bat_enemy;
spr_die = spr_bat_enemy_die;
spr_hurt = spr_bat_enemy_hurt;

// Enemy Functions
enemy_script[ENEMYSTATE.WANDER] = BatWander;
enemy_script[ENEMYSTATE.CHASE] = BatChase;
enemy_script[ENEMYSTATE.ATTACK] = -1;
enemy_script[ENEMYSTATE.HURT] = GenericEnemyHurt;
enemy_script[ENEMYSTATE.DIE] = GenericEnemyDie;

// Drop items on death
entity_drop_list = choose
(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_arrow_drop],
	[obj_arrow_drop, obj_arrow_drop]
);
entity_drop_count = array_length(entity_drop_list);
