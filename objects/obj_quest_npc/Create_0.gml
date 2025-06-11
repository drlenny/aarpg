// Inherit the parent event
event_inherited();

image_speed = 0;

// if quest is completed, update the sprite
if (global.quest_status[? "TheHatQuest"] == 2)
{
	sprite_index = spr_questy_hat;
}
