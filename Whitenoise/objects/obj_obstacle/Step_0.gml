/// @description Insert description here
// You can write your code in this editor

//determines sprite based on index
switch(m_obstacle_index)
{
	case 0:
		sprite_index = spr_rock1;
		break;
	case 1:
		sprite_index = spr_rock2;
		break;
	case 2:
		sprite_index = spr_tree;
		break;
	case 3:
		sprite_index = spr_flag2;
		break;
	case 4:
		sprite_index = spr_flag1;
		break;
	case 5:
		sprite_index = spr_ramp1;
		break;
	case 6:
		sprite_index = spr_grass;
		break;
	case 7:
		sprite_index = spr_ramp2;
		break;
	case 8:
		sprite_index = spr_ice1;
		break;
	case 9:
		sprite_index = spr_mogul;
		break;
	case 10:
		sprite_index = spr_bush;
		break;
	case 11:
		sprite_index = spr_ice2;
		break;
}

y -= global.speed;

if(y <= -500)
	instance_destroy();
	
if(place_meeting(x, y, obj_player) && !m_obstacle_has_collided)
{
	audio_play_sound(snd_rock, 1, false);
	m_obstacle_has_collided = true;
}