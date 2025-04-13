state = PlayerStateFree;
state_attack = AttackSlash;
hit_by_attack = -1;
last_state = state;

collision_map = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
h_speed = 0;
v_speed = 0;
input_direction = 0;
input_magnitude = 0;
speed_walk = 2.0;
speed_roll = 3.0;
distance_roll = 52;
distance_bonk = 25;
distance_bonk_height = 12;
speed_bonk = 1.5;
z = 0;

key_up = bool;
key_down = bool;
key_left = bool;
key_right = bool;
key_activate = bool;
key_attack = bool;
key_item = bool;

sprite_roll = spr_player_roll;
sprite_run = spr_player_run;
sprite_idle = spr_player;
local_frame = 0;

// position player appropriately on room transition
if (global.target_x != -1)
{
	x = global.target_x;
	y = global.target_y;
	direction = global.target_direction
}