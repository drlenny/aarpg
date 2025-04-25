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
enemy_script[ENEMYSTATE.HURT] = SlimeHurt;
enemy_script[ENEMYSTATE.DIE] = SlimeDie;