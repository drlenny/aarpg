/// @arg Response

function DialogueResponses(){
	switch(argument0)
	{
		case 0: break;
		case 1: NewTextBox("You gave response A!", 1); break;
		case 2: NewTextBox("You gave response B! Any further response?", 1, ["3:Yes!", "0:No."]); break;
		case 3: NewTextBox("Thanks for your responses!", 0); break;
		case 4: 
		{
			NewTextBox("Thanks!\nI think I left it in the scary\ncave to the north east.", 2);
			NewTextBox("Good luck! I will wait here for you.", 2);
			global.quest_status[? "TheHatQuest"] = 1;
		} break;
		case 5: 
		{
			NewTextBox("Awww man :(", 2);
			NewTextBox("Well, if you change you're mind I'll be here.", 2);
			NewTextBox("Probably crying.", 2);
		}break;
		case 6: 
		{
			NewTextBox("Hooray! I am behatted once more!", 2);
			global.quest_status[? "TheHatQuest"] = 2;
			with (obj_quest_npc) sprite_index = spr_questy_hat;
			with (obj_hat) instance_destroy();
			global.inst_lifted = noone;
			with (obj_player)
			{
				sprite_idle = spr_player;
				sprite_run = spr_player_run;
			}
		}break;
		case 7: NewTextBox("Oh no! Hat thief!\nCURSE YOU!!!"); break;
		case 8: PurchaseItem(activate.item, activate.item_amount, activate.item_cost); break;
		default: break;
	}
}