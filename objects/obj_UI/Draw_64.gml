/// @description Draw Health

// Maybe modify how the health calculations and fractions work at a later time

var _player_health = global.player_health;
var _player_health_max = global.player_health_max;
var _player_health_frac = frac(_player_health);
_player_health -= _player_health_frac;

for (var i = 1; i <= _player_health_max; i++)
{
	var _image_index = (i > _player_health);
	if (i == _player_health+1)
	{
		_image_index += (_player_health_frac > 0);
		_image_index += (_player_health_frac > 0.25);
		_image_index += (_player_health_frac > 0.5);
	}
	
	draw_sprite_ext(spr_health, _image_index, 16 + ((i - 1) * 30), 16, 2, 2, 0, c_white, 1);
}