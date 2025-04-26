/// @arg Message
/// @arg Background
/// @arg [Responses]

// using draw_sprite_stretched() for the box sprite
// this is for the text
function NewTextBox(){
	var _obj;
	if(instance_exists(obj_text)) _obj = obj_text_queued; else _obj = obj_text;
	with (instance_create_layer(0, 0, "Instances", _obj))
	{
		message = argument[0];
		if (instance_exists(other)) origin_instance = other.id else origin_instance = noone;
		if (argument_count > 1) background = argument[1]; else background = 1;
		if (argument_count > 2)
		{
			// trim markers from responses
			var _array=argument[2];

			for(var i=0; i<array_length(_array); i++)
			{
				responses[i]=_array[i];
			}

			for (var i = 0; i < array_length(responses); i++)
			{
				var _marker_position = string_pos(":", responses[i]);
				response_scripts[i] = string_copy(responses[i], 1, _marker_position - 1);
				response_scripts[i] = real(response_scripts[i]);
				responses[i] = string_delete(responses[i], 1, _marker_position);
				// debug break
				breakpoint = 10;
			}
		}
		else
		{
			responses = [-1];
			response_scripts = [-1];
		}
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