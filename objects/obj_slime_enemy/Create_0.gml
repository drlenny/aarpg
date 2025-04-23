// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

// Enemy Sprites
spr_move = spr_slime_enemy;
spr_attack = spr_slime_enemy_attack;

// Enemy Functions
enemy_script[ENEMYSTATE.WANDER] = SlimeWander;
enemy_script[ENEMYSTATE.CHASE] = SlimeChase;
enemy_script[ENEMYSTATE.ATTACK] = SlimeAttack;