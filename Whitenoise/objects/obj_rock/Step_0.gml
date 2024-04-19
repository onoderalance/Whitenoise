/// @description Insert description here
// You can write your code in this editor

y -= m_rock_speed;

if(y <= -500)
	instance_destroy();
	
if(place_meeting(x, y, obj_player) && !m_rock_has_collided)
{
	audio_play_sound(snd_rock, 1, false);
	m_rock_has_collided = true;
}