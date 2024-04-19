/// @description Insert description here
// You can write your code in this editor

switch(m_menu_stage)
{
	case 0: //initial keyboard test
		if(ds_list_size(global.midi_messages) > 0)
			m_menu_stage = 1; //advance to next stage as we have found some kind of input
		break;
	case 1: //octave 1
		break;
	case 2: //octave 2
		break;
	case 3: //ready to enter game!
		break;
}