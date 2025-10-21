/// @desc Initialise & Globals
randomize();

global.game_save_slot = 0;

global.game_paused = false;
global.dialogue_sequence = false;
global.text_speed = 0.75;
global.target_room = -1;
global.target_x = -1;
global.target_y = -1;
global.target_direction = 0;

// Pause preventions
global.text_box = false;
global.room_transition = false;

// Player resources
global.player_health_max = 3;
global.player_health = global.player_health_max;
global.player_money = 100;

// Items
global.player_has_any_items = false;
global.player_equipped = ITEM.BOMB
global.player_ammo = array_create(ITEM.TYPE_COUNT, -1);
global.player_item_unlocked = array_create(ITEM.TYPE_COUNT, false);
global.player_ammo[ITEM.BOMB] = 0;
global.player_ammo[ITEM.BOW] = 0;
global.player_ammo_max = 99;

//// TEMPORARY VALUES item unlocks for testing
//global.player_item_unlocked[ITEM.BOMB] = true;
//global.player_has_any_items = true;
//global.player_ammo[ITEM.BOMB] = 5;
//global.player_item_unlocked[ITEM.BOW] = true;
//global.player_ammo[ITEM.BOW] = 15;
//global.player_item_unlocked[ITEM.HOOK] = true;

// Quest status
global.quest_status = ds_map_create();
global.quest_status[? "TheHatQuest"] = 0;
global.boulder_destroyed = false;

global.inst_lifted = noone;
global.inst_camera = instance_create_layer(0, 0, layer, obj_camera);
global.inst_UI = instance_create_layer(0, 0, layer, obj_UI);

surface_resize(application_surface, RESOLUTION_W, RESOLUTION_H);
room_goto(r_village);