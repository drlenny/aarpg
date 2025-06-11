/// @desc drop fragments and items

if(entity_fragment_count > 0)
{
	DropItems(x, y, entity_fragment_count, entity_fragment);
}

if (entity_drop_list != -1) && (entity_drop_count != -1)
{
	var _item = entity_drop_list[irandom(array_length(entity_drop_list) - 1)];
	DropItems(x, y, entity_drop_count, _item);
	
}