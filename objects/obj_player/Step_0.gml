
// Get Player Input
var _key_up = keyboard_check(vk_up) or keyboard_check(ord("W"));
var _key_down = keyboard_check(vk_down) or keyboard_check(ord("S"));
var _key_left = keyboard_check(vk_left) or keyboard_check(ord("A"));
var _key_right = keyboard_check(vk_right) or keyboard_check(ord("D"));
var _key_activate = keyboard_check_pressed(vk_space);
var _key_attack = keyboard_check_pressed(vk_shift);
var _key_item = keyboard_check_pressed(vk_control);

var _input_direction = point_direction(0, 0, _key_right - _key_left, _key_down - _key_up);
var _input_magnitude = (_key_right - _key_left != 0) || (_key_down - _key_up != 0);

// Movement
h_speed = lengthdir_x(_input_magnitude * speed_walk, _input_direction);
v_speed = lengthdir_y(_input_magnitude * speed_walk, _input_direction);

PlayerCollision();

// Update Sprite Index
var _old_sprite = sprite_index;
if (_input_magnitude != 0)
{
	direction = _input_direction;
	sprite_index = sprite_run;
} else sprite_index = sprite_idle;
if (_old_sprite != sprite_index) local_frame = 0;

// Update Image Index
PlayerAnimateSprite();