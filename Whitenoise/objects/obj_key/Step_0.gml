/// @description Insert description here
// You can write your code in this editor

//initial visual jump up
if(m_key_create_timer > 0)
{
	m_key_create_timer--;
	return;
}
if(m_key_create_jump > 0)
{
	switch(m_key_note)
	{
		//for black keys, slightly higher
		case 1:
		case 3:
		case 6:
		case 8:
		case 10:
			y = lerp(y, 870, 0.25);
			break;
		default:
			y = lerp(y, 900, 0.25);
			break;
	}
	
	m_key_create_jump--;
	return;
}