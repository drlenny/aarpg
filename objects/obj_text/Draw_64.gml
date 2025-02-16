/// @description Draw Textbox

draw_sprite_stretched(spr_text_box_bg, background, x1, y1, x2 - x1, y2 - y1);
draw_set_font(f_text);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
draw_set_color(c_black);

var _print = string_copy(message, 1, text_progress);
draw_text((x1+x2)/2, y1+8, _print);
draw_set_color(c_white);
draw_text((x1+x2)/2, y1+7, _print);