global.loopnumber = 0
global.IsAlive = true
//setup
frame = 0;
image_blend = c_red;
cloneFileName = "recording.json";

// load data
if (file_exists(cloneFileName))
	{
		cloneFile  = file_text_open_read(cloneFileName);
		cloneDataRoot = json_decode(file_text_read_string(cloneFile));
		cloneData = cloneDataRoot[?"root"];
		cloneFrames = ds_list_size(cloneData);
		cloneFile = file_text_close(cloneFile);
	}
else
{
	instance_destroy();
}