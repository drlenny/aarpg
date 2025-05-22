function ActivateHatCat(){
	// variable for check if player is holding hat
	var _has_hat = (global.inst_lifted != noone) && (global.inst_lifted.object_index == obj_hat);
	
	switch (global.quest_status[? "TheHatQuest"])
	{
		case 0: //not started
		{
			//offer quest
			NewTextBox("Hello there! You look like a brave adventurer!\nWhat with the cape and all.", 2);

			
			if (_has_hat)
			{
				// complete quest
				NewTextBox("Hey! That's my hat! Can I have it?", 2, 
				["6:Of course!", "7: Haha, nope!"]);
			}
			else
			{
				NewTextBox("Could you help me find my missing hat?", 2, 
				["4:Of course!", "5:This task is beneath me."]);
			}
				

		}
		break;
		
		case 1: //quest in progress
		{
			if (_has_hat)
			{
				//complete quest
				NewTextBox("Hey! That's my hat! Can I have it?", 2, 
				["6:Of course!", "7: Haha, nope!"]);
			}
			else
			{
				//clue reminder
				NewTextBox("I miss my hat :(", 2);
				NewTextBox("It should be in that cave to the north east.", 2);
				NewTextBox("You might need some new items to get there.", 2);
			}	
		}
		break;
		
		case 2: //quest already completed
		{
			NewTextBox("I love my hat! :)", 2);
		} 
		break;
	}
}