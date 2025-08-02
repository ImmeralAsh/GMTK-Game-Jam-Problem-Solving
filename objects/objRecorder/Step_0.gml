//Records inputs while boss is alive
if (global.IsAlive == true)
{ 
	cloneRecord = !cloneRecord;
} 
else
{
	//stops recording
		var _wrapper =  ds_map_create();
		ds_map_add_list(_wrapper, "root", cloneRecordList);
		var _inputlist = json_encode(_wrapper);
		if (file_exists("recording.json")) file_delete("recording.json");
		var _recordFile = file_text_open_write("recording.json");
		file_text_write_string(_recordFile, _inputlist);
		file_text_close(_recordFile);
		ds_map_destroy(_wrapper);
}

//Records Each Frame
if (cloneRecord) && (instance_exists(Player))
{
	if (!ds_exists(cloneRecordList, ds_type_list))
		{
			cloneRecordFrames = 1;
			cloneRecordList = ds_list_create();
		}
	var _frameToRecord = ds_map_create();
	with (Player)
		{
			_frameToRecord[? "x"] = -x;
			_frameToRecord[? "y"] = -y;
			_frameToRecord[? "xscale"] = -image_xscale;
			_frameToRecord[? "sprite"] = sprite_index;
			_frameToRecord[? "image"] = image_index;
			_frameToRecord[? "SwordX"] = -objSword.x;
			_frameToRecord[? "SwordAngle"] = -objSword.image_angle;
			_frameToRecord[? "state"] = state;
		}
		
		ds_list_add(cloneRecordList, _frameToRecord);
		ds_list_mark_as_map(cloneRecordList, ds_list_size(cloneRecordList)-1);
		
}