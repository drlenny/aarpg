/// @desc Enums and Setup

enum TRANS_TYPE
{
	SLIDE,
	FADE,
	PUSH,
	STAR,
	WIPE
}

width = RESOLUTION_W;
height = RESOLUTION_H;
height_half = (height * 0.5) + 20;
percent = 0;
leading = OUT;

global.room_transition = true;