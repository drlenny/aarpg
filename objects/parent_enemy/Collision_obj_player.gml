/// @description Contact damage to player

if (enemy_HP > 0)
{
	HurtPlayer(point_direction(x, y, obj_player.x, obj_player.y), enemy_force_touch, enemy_damage_touch);
}