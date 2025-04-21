// Inherit the parent event
event_inherited();

state = ENEMYSTATE.WANDER;

// Enemy Sprites
spr_move = spr_slime_enemy;

// Enemy Functions
enemy_script[ENEMYSTATE.WANDER] = SlimeWander;
enemy_script[ENEMYSTATE.CHASE] = SlimeChase;