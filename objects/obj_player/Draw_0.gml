draw_sprite(spr_shadow, 0, floor(x), floor(y));

// Hookshot (before player)
if (state == PlayerStateHook) && (image_index != 3) DrawHookChain();

if (invulnerable != 0) && ((invulnerable mod 8 < 2) == 0) && (flash == 0)
{
	// skip draw
	
}
else
{
	if (flash != 0)
	{
		shader_set(flash_shader);
		var _u_flash = shader_get_uniform(flash_shader, "flash");
		shader_set_uniform_f(_u_flash, flash);
		
	}
	
	draw_sprite_ext(
		sprite_index,
		image_index,
		floor(x),
		floor(y-z),
		image_xscale,
		image_yscale,
		image_angle,
		image_blend,
		image_alpha
	);
	
	if (shader_current() != -1) shader_reset();
}

// Hookshot (after player)
if (state == PlayerStateHook) && (image_index == 3) DrawHookChain();

function DrawHookChain()
{
	var _originX = floor(x);
	var _originY = floor(y) - 7;
	
	var _chains = hook div hook_size;
	var _hook_dirX = sign(hook_x);
	var _hook_dirY = sign(hook_y);
	for (var i = 0; i < _chains; i++)
	{
		draw_sprite
		(
			spr_hook_chain,
			0,
			_originX + hook_x - (i * hook_size * _hook_dirX),
			_originY + hook_y - (i * hook_size * _hook_dirY)
		);
	}
	draw_sprite(spr_hook_blade, image_index, _originX + hook_x, _originY + hook_y);
}