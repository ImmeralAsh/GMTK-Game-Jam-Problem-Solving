//Checa se cada tecla está pressionada
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);
var _hspd = _right - _left;
var _vspd = _down - _up;
var _dir = point_direction(0, 0, _hspd, _vspd);
//coloca animações para cada direção apontada
switch (keyboard_key)
{
    case vk_left:
		sprite_index = LinkWalkSide;
		image_xscale = 1;
    break;

    case vk_right:
        sprite_index = LinkWalkSide;
		image_xscale = -1;
    break;

    case vk_up:
        sprite_index = LinkWalkUp;
    break;

    case vk_down:
        sprite_index = LinkWaklDown;
    break;
	default: 
		image_index = 0;
		image_speed = 0;
	break;	
}
//Normaliza a velocidade em todas as direções
if (_hspd != 0 || _vspd != 0)
{
	image_speed	= 1
    var _spd = 3;
	//roda a espada pra mesma direção que o personagem
	weapon.image_angle = _dir-90;
    var _xadd = lengthdir_x(_spd, _dir);
    var _yadd = lengthdir_y(_spd, _dir);
    x = x + _xadd;
    y = y + _yadd;
}
//Define o dash
if (_hspd != 0 || _vspd != 0) && keyboard_check_pressed(vk_space)
{
	image_speed = 2
		switch(keyboard_key)
	{
		case vk_left:
		sprite_index = LinkDashSide;
		image_xscale = 1;
		break;

		case vk_right:
        sprite_index = LinkDashSide;
		image_xscale = -1;
		break;

		case vk_up:
        sprite_index = LinkDashUp;
		break;

		case vk_down:
        sprite_index = LinkDashDown;
		break;
	}
	var _dashspd = 60;
	 //roda a espada pra mesma direção que o personagem
	 weapon.image_angle = -_dir-90;
	 var _xadd = lengthdir_x(_dashspd, _dir);
	var _yadd = lengthdir_y(_dashspd, _dir);
    x = x + _xadd;
    y = y + _yadd;
}
if keyboard_check_pressed(ord("z"))
{
	if(isSwinging) = false
	{
		isSwinging = true;	
	}
	else
	{
		instance_create_depth(_dir.x+4, _dir.y+4, -1, objSwordhitbox)
	}
}