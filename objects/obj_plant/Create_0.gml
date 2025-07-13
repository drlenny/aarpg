// Inherit the parent event
event_inherited();

entity_drop_list = choose
(
	[obj_coin],
	[obj_coin, obj_coin],
	[obj_bomb_drop],
	[obj_arrow_drop],
	[obj_arrow_drop, obj_arrow_drop],
	-1,
	-1,
	-1,
	-1
);
entity_drop_count = array_length(entity_drop_list);
