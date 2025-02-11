/// @desc Initialise & Globals
randomize();

global.game_paused = false;

global.inst_camera = instance_create_layer(0, 0, layer, obj_camera);


room_goto(r_village);