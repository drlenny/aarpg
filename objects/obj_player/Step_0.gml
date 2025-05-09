// Get Player Input
key_up = keyboard_check(vk_up) || keyboard_check(ord("W"));
key_down = keyboard_check(vk_down) || keyboard_check(ord("S"));
key_left = keyboard_check(vk_left) || keyboard_check(ord("A"));
key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
key_activate = keyboard_check_pressed(vk_space);
key_attack = mouse_check_button_pressed(mb_left);
key_item = keyboard_check_pressed(vk_control);

input_direction = point_direction(0, 0, key_right - key_left, key_down - key_up);
input_magnitude = (key_right - key_left != 0) || (key_down - key_up != 0);

if (!global.game_paused) 
{
	script_execute(state);
	invulnerable = max(invulnerable - 1, 0);
	flash = max(flash - 0.05, 0);
}
depth = -bbox_bottom;