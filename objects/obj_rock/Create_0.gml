// Inherit the parent event
event_inherited();

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
