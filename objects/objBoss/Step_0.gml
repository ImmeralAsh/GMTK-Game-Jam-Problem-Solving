if (keyboard_check_pressed(ord("K")))
	{
		global.IsAlive = false;
	}
if(frame <cloneFrames)
{
	var frameData = cloneData [|frame];
	x = frameData[? "x"];
	y = frameData [? "y"];
	image_xscale = frameData [? "xscale"];
	sprite_index = frameData [? "sprite"];
	image_index = frameData [? "image"];
	var state = frameData [? "state"];
	frame++;
}
else 
{
	instance_destroy();
}
