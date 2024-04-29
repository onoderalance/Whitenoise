/// @description Insert description here
// You can write your code in this editor

if(irandom(1) == 1)
	sprite_index = spr_rock1;
else
	sprite_index = spr_rock2;

m_obstacle_index = -1; //determines obstacle depending on semitone inteval

m_obstacle_has_collided = false;