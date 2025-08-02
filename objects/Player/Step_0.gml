//Inputs
_left = keyboard_check(vk_left);
_right = keyboard_check(vk_right);
_up = keyboard_check(vk_up);
_down = keyboard_check(vk_down);
dashKey = keyboard_check_pressed(vk_space);
swingKey = keyboard_check_pressed(ord("Z"));
_hdir = _right - _left; //11-15 Movement Direction
_vdir = _down - _up;
_dir = point_direction(0, 0, _hdir, _vdir);
_hspd = 3
_vspd = 3
//coloca animações para cada direção apontada
switch (point_direction(0,0,_hdir, _vdir))
	{
		case point_direction(0,0,_hdir, _vdir) :
			sprite_index = LinkWalkSide;
			image_xscale = 1;
		break;

		case (point_direction(0,0,_hdir, _vdir)<= 180 || point_direction(0,0,_hdir, _vdir) > 90):
			sprite_index = LinkWalkSide;
			image_xscale = -1;
		break;

		case point_direction(0,0,_hdir, _vdir)>=90 && point_direction(0,0,_hdir, _vdir) <180:
			sprite_index = LinkWalkUp;
		break;

		case point_direction(0,0,_hdir, _vdir)>=270 && point_direction(0,0,_hdir, _vdir)<180:
			sprite_index = LinkWaklDown;
		 break;
		default: 
			image_index = 0;
			image_speed = 0;
		break;	
	}

state();
