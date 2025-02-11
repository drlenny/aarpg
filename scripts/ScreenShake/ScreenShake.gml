/// @desc ScreenShake(magnitude,frames)
/// @arg Magnitude sets the strength of the shake (distance range)
/// @arg Frames sets the length of the shake in frames (60 = 1 second)
function ScreenShake(){
	with (global.inst_camera)
	{
		// Won't apply new screen shake if new one is smaller than current on in effect
		if (argument0 > shake_remain)
		{
			shake_magnitude = argument0;
			shake_remain = shake_magnitude;
			shake_length = argument1;
		}
	}
}