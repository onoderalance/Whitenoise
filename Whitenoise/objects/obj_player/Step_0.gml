/// @description Insert description here
// You can write your code in this editor

//determines player position based on player_position variable

x = m_player_position*(room_width/12);

if(keyboard_check(ord("1")))
	m_player_position = 0;
if(keyboard_check(ord("2")))
	m_player_position = 1;
if(keyboard_check(ord("3")))
	m_player_position = 2;
if(keyboard_check(ord("4")))
	m_player_position = 3;
if(keyboard_check(ord("5")))
	m_player_position = 4;
if(keyboard_check(ord("6")))
	m_player_position = 5;
if(keyboard_check(ord("7")))
	m_player_position = 6;
if(keyboard_check(ord("8")))
	m_player_position = 7;
if(keyboard_check(ord("9")))
	m_player_position = 8;
if(keyboard_check(ord("0")))
	m_player_position = 9;
if(keyboard_check(ord("O")))
	m_player_position = 10;
if(keyboard_check(ord("P")))
	m_player_position = 11;

/*
switch(m_player_position)
{
	case 0:
		break;
	case 1:
		break;
	case 2:
		break;
	case 3:
		break;
	case 4:
		break;
	case 5:
		break;
	case 6:
		break;
	case 7:
		break;
	case 8:
		break;
	case 9:
		break;
	case 10:
		break;
	case 11:
		break;
}
*/