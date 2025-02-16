function NewTextBox(){
	var _obj;
	if(instance_exists(obj_text)) _obj = obj_text_queued; else _obj = obj_text;
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		message = argument[0];
		if (instance_exists(other)) origin_instance = other.id else origin_instance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
	}
	
	// put player into locked state
	with (obj_player)
	{
		if (state != PlayerStateLocked)
		{
			last_state = state;
			state = PlayerStateLocked;
		}
	}
}