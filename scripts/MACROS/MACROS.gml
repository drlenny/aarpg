
#macro FRAME_RATE 60
#macro TILE_SIZE 16
#macro CARDINAL_DIR round(direction/90)
#macro ROOM_START r_village

#macro RESOLUTION_W 640
#macro RESOLUTION_H 360

#macro TRANSITION_SPEED 0.02
#macro OUT 0
#macro IN 1

#macro CARRY_HEIGHT 13
#macro MAGNETIZE 16
#macro COLLECTION_RADIUS 5

enum ENEMYSTATE
{
	IDLE,
	WANDER,
	CHASE,
	ATTACK,
	HURT,
	DIE,
	WAIT
}

enum ITEM
{
	NONE,
	BOMB,
	BOW,
	HOOK,
	TYPE_COUNT
}

enum HOOK_STATUS
{
	EXTENDING,
	PULL_TO_PLAYER,
	PULL_TO_ENTITY,
	MISSED
}