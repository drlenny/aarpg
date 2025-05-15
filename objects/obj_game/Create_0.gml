/// @desc Initialise & Globals
randomize();

global.game_paused = false;
global.text_speed = 0.75;
global.target_room = -1;
global.target_x = -1;
global.target_y = -1;
global.target_direction = 0;
global.player_health_max = 3;
global.player_health = global.player_health_max;

global.inst_lifted = noone;
global.inst_camera = instance_create_layer(0, 0, layer, obj_camera);
global.inst_UI = instance_create_layer(0, 0, layer, obj_UI);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(r_village);