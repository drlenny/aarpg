collision_map = layer_tilemap_get_id(layer_get_id("Col"));

image_speed = 0;
h_speed = 0;
v_speed = 0;
speed_walk = 2.0;
speed_roll = 3.0;
distance_roll = 52;

sprite_roll = spr_player_roll;
sprite_run = spr_player_run;
sprite_idle = spr_player;
local_frame = 0;
