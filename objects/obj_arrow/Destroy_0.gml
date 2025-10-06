/// @description hit sfx

var _cam = view_camera[0];
var _camX = camera_get_view_x(_cam);
var _camY = camera_get_view_y(_cam);
if (point_in_rectangle(x, y, _camX, _camY, _camX + camera_get_view_width(_cam), _camY + camera_get_view_height(_cam)))
{
	instance_create_depth(x, y, depth, obj_arrow_hit_sfx);
}