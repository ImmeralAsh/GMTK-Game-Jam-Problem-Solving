//Checa se cada tecla está pressionada
var _left = keyboard_check(vk_left);
var _right = keyboard_check(vk_right);
var _up = keyboard_check(vk_up);
var _down = keyboard_check(vk_down);
var _hspd = _right - _left;
var _vspd = _down - _up;
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
        sprite_index = PlayerWalkDown;
    break;
	default: 
		sprite_index = LinkSprite;
		image_index = 0;
		image_speed = 0;
	break;	
}
//Normaliza a velocidade em todas as direções
if (_hspd != 0 || _vspd != 0)
{
	image_speed	= 1
    var _spd = 5;
    var _dir = point_direction(0, 0, _hspd, _vspd);
    var _xadd = lengthdir_x(_spd, _dir);
    var _yadd = lengthdir_y(_spd, _dir);
    x = x + _xadd;
    y = y + _yadd;
}