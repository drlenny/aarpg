/// @description Draw Textbox

draw_sprite_stretched(spr_text_box_bg, background, x1, y1, x2 - x1, y2 - y1);
DrawSetText(c_black, f_text, fa_center, fa_top);
var _print = string_copy(message, 1, text_progress);

// create response selection indicator
if (responses[0] != -1) && (text_progress >= string_length(message))
{
	for (var i = 0; i < array_length(responses); i++)
	{
		_print += "\n";
		if (i == response_selected) _print += "> ";
		_print += responses[i];
		if (i == response_selected) _print += " <";
	}
}

draw_text((x1+x2)/2, y1+8, _print);
draw_set_color(c_white);
draw_text((x1+x2)/2, y1+7, _print);