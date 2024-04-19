/// @description Insert description here
// You can write your code in this editor

switch(m_menu_stage)
{
	case 0: //initial keyboard test
		if(ds_list_size(global.midi_messages) > 0)
			m_menu_stage = 1; //advance to next stage as we have found some kind of input
		break;
	case 1: //octave 1 (harmony)
		if(ds_list_size(global.midi_messages) > 0)
		{
			var _midi_num = global.midi_messages[|0][|1];
			show_debug_message(_midi_num);
			_midi_num = floor(_midi_num/12);
			show_debug_message(_midi_num);
			m_menu_stage = 2; //advance to next stage as we have set the new harmony octave
		}
		break;
	case 2: //octave 2 (melody)
		if(ds_list_size(global.midi_messages) > 0)
		{
			var _midi_num = global.midi_messages[|0][|1];
			show_debug_message(_midi_num);
			_midi_num = floor(_midi_num/12);
			show_debug_message(_midi_num);
			m_menu_stage = 3; //advance to next stage as we have set the new harmony octave
		}
		break;
	case 3: //ready to enter game!
		break;
}