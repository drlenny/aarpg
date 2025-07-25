/// @description Draw UI

// Draw Health
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

// Draw Coins
var _xx, _yy;

// Coin Icon
_xx = 58;
_yy = 60;
draw_sprite_ext(spr_coin_ui, 0, _xx, _yy, 2, 2, 0, c_white, 1);

// Coin Text
DrawSetText(c_black, f_text, fa_left, fa_top);
_xx += sprite_get_width(spr_coin_ui) + 18;
_yy = 52;
var _str = string(global.player_money);
draw_text(_xx + 2, _yy, _str);
draw_text(_xx - 2, _yy, _str);
draw_text(_xx, _yy + 2, _str);
draw_text(_xx, _yy - 2, _str);
draw_set_color(c_white);
draw_text(_xx, _yy, _str);

// Draw Item Box
_xx = 16;
_yy = 48;
draw_sprite_ext(spr_item_UI_box, 0, _xx, _yy, 2, 2, 0, c_white, 1);
if (global.player_has_any_items)
{
	draw_sprite_ext(spr_item_ui, global.player_equipped, _xx, _yy, 2, 2, 0, c_white, 1);
	if (global.player_ammo[global.player_equipped] != -1)
	{
		DrawSetText(c_white, f_ammo, fa_right, fa_bottom);
		draw_text
		(
			_xx + sprite_get_width(spr_item_UI_box) + 18,
			_yy + sprite_get_height(spr_item_UI_box) + 16,
			string(global.player_ammo[global.player_equipped])
		);
	}
}