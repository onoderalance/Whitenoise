/// @description Insert description here
// You can write your code in this editor

y -= global.speed;

if(y <= -500)
	instance_destroy();
	
if(place_meeting(x, y, obj_player) && !m_obstacle_has_collided)
{
	audio_play_sound(snd_rock, 1, false);
	m_obstacle_has_collided = true;
}