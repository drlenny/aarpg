// Inherit the parent event
event_inherited();

// if quest is completed, update the sprite
if (global.quest_status[? "TheHatQuest"] == 2)
{
	sprite_index = spr_questy_hat;
}
