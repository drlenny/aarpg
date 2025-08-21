/// @description Cause a room transition

if (instance_exists(obj_player)) && (position_meeting(obj_player.x, obj_player.y, id))
{
	if (!instance_exists(obj_transition)) && (obj_player.state != PlayerStateDead)
	{
		global.target_room = target_room;
		global.target_x = target_x;
		global.target_y = target_y;
		global.target_direction = obj_player.direction;
		if (keep_walking == false)
		{
			obj_player.h_speed = 0;
			obj_player.v_speed = 0;
			obj_player.image_speed = 0;
		}
	
		// trasition effect
		with (obj_player) state = PlayerStateTransition;
		RoomTransition(TRANS_TYPE.SLIDE, target_room);
	
		instance_destroy();
	}
}