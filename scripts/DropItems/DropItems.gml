/// @desc DropItems(item_x, item_y, item, obj)
/// @arg item_x
/// @arg item_y
/// @arg item
/// @arg obj

function DropItems(item_x, item_y, item, obj){
	if(item > 1)
	{
		var _anglePerItem = 360/item;
		var _angle = random(360);
		for (var i = 0; i < item; i++)
		{
			with(instance_create_layer(item_x, item_y, "Instances", obj))
			{
				direction = _angle;
				spd = 0.75 + (item * 0.1) + random(0.1);
			}
			_angle += _anglePerItem;
		}
		
		
	}else instance_create_layer(item_x, item_y, "Instances", obj);
}