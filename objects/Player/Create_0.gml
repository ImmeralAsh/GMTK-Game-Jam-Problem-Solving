//Inputs
_left = keyboard_check(vk_left);
_right = keyboard_check(vk_right);
_up = keyboard_check(vk_up);
_down = keyboard_check(vk_down);
dashKey = keyboard_check_pressed(vk_space);
swingKey = keyboard_check_pressed(ord("Z"));

//Misc Variables	

_hdir = _right - _left; //11-15 Movement Direction
_vdir = _down - _up;
_dir = point_direction(0, 0, _hdir, _vdir);
_hspd =3;
_vspd =3;

health = 3;
friction = 5;

weapon = instance_create_depth(x, y, depth-1, objSword); //Weapon Creation
weapon.image_speed = 0;
weapon_x_offset = 2;
weapon_y_offset = 4;

//Dash And Attacks
canSwing = false;
swingTime = 15;
canDash = true;
dashDistance = 60;
dashTime = 8;

Walking = function()
{
	if (_hdir != 0 || _vdir != 0)
	{
	image_speed	= 1
    var _spd = 3;
	//roda a espada pra mesma direção que o personagem
	weapon.image_angle = _dir-90;
    var _xadd = lengthdir_x(_hspd, _dir);
    var _yadd = lengthdir_y(_vspd, _dir);
    x = x + _xadd;
    y = y + _yadd;
	}
	canDash = true;
	if (canDash) && (dashKey)
	{ 
		canDash = false;
		state = Dashing;
		_dashSpd = dashDistance/dashTime;
		_dashNrg = dashDistance;
		state = Dashing;
	}
	canSwing = true;
	swingTime = 15;
	if (canSwing) && (swingKey)
	{
		//lock hitbox direction
		instance_create_depth(weapon.x+1, weapon.y+1, -1, objSwordhitbox);
		objSwordhitbox.image_angle = weapon.image_angle;
		canSwing = false;
		state = Swinging;
	}

}
Dashing = function()
{
	//Andando com o Dash
	var _xadd = lengthdir_x( _dashSpd, _dir);
    var _yadd = lengthdir_y( _dashSpd, _dir);
	x += _xadd;
	y += _yadd;
	//Finalizando o Dash
	_dashNrg -= _dashSpd;
	if (_dashNrg <= 0)
	{
		_hspd = 0;
		_vspd = 0;
		state = Walking;
	}
}
Swinging = function()
{
		swingTime -= 1;
		if (swingTime >= 0)
		{
			canSwing = false;
			_hspd = 0;
			_vspd = 0;	
		}
		else
		{
			state = Walking;
		}
}

state = Walking;