// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

// Enemy Sprites
spr_move = spr_slime_enemy;
spr_attack = spr_slime_enemy_attack;
spr_die = spr_slime_enemy_die;
spr_hurt = spr_slime_enemy_hurt;

// Enemy Functions
enemy_script[ENEMYSTATE.WANDER] = SlimeWander;
enemy_script[ENEMYSTATE.CHASE] = SlimeChase;
enemy_script[ENEMYSTATE.ATTACK] = SlimeAttack;
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
