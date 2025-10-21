/// @desc Essential entity setup

z = 0;
flash = 0;
flash_shader = sh_white_flash;
u_flash = shader_get_uniform(flash_shader, "flash");
lifted = 0;
thrown = false;
entity_drop_list = -1;
entity_drop_count = -1;
collision_map = layer_tilemap_get_id(layer_get_id("Col_Wall"));


entity_drop_list = choose
(
	[obj_bomb_drop],
	[obj_coin],
	[obj_coin, obj_coin],
	-1,
	-1,
	-1,
	-1
);
entity_drop_count = array_length(entity_drop_list);
