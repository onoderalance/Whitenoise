/// @description Insert description here
// You can write your code in this editor

switch(m_menu_stage)
{
	case 0: //initial keyboard test
		if(ds_list_size(global.midi_notes_on) > 0)
			m_menu_note_held = true;
		if(m_menu_note_held && ds_list_size(global.midi_notes_on) == 0)
		{
			m_menu_note_held = false;
			m_menu_stage = 1; //advance to next stage as we have found some kind of input
		}
		break;
	case 1: //octave 1 (harmony)
		if(ds_list_size(global.midi_notes_on) > 0 && !m_menu_note_held)
		{
			m_menu_note = global.midi_notes_on[|0];
			show_debug_message(m_menu_note);
			m_menu_note = floor(m_menu_note/12);
			show_debug_message(m_menu_note);
			m_menu_note_held = true;
		}
		if(m_menu_note_held && ds_list_size(global.midi_notes_on) == 0)
		{
			global.octave_harmony = m_menu_note;
			m_menu_note = -1;
			m_menu_note_held = false;
			m_menu_stage = 2; //advance to next stage as we have found some kind of input
		}
		break;
	case 2: //octave 2 (melody)
		if(ds_list_size(global.midi_notes_on) > 0 && !m_menu_note_held)
		{
			m_menu_note = global.midi_notes_on[|0];
			show_debug_message(m_menu_note);
			m_menu_note = floor(m_menu_note/12);
			show_debug_message(m_menu_note);
			m_menu_note_held = true;
		}
		if(m_menu_note_held && ds_list_size(global.midi_notes_on) == 0)
		{
			global.octave_melody = m_menu_note;
			m_menu_note = -1;
			m_menu_note_held = false;
			m_menu_stage = 3; //advance to next stage as we have found some kind of input
		}
		break;
	case 3: //ready to enter game!
		if(ds_list_size(global.midi_notes_on) > 1 && !m_menu_note_held)
		{
			var _harmony_note_found = false;
			var _melody_note_found = false;
			show_debug_message("octave 1: " + string(global.octave_harmony));
			show_debug_message("octave 2: " + string(global.octave_melody));
			for(var _i = 0; _i < ds_list_size(global.midi_notes_on); _i++)
			{
				show_debug_message(string(global.midi_notes_on[|_i]%12));
				if(floor(global.midi_notes_on[|_i]/12) == global.octave_harmony)
					_harmony_note_found = true;
				if(floor(global.midi_notes_on[|_i]/12) == global.octave_melody)
					_melody_note_found = true;
			}
			if(_harmony_note_found && _melody_note_found)
				m_menu_note_held = true;
		}
		if(m_menu_note_held && ds_list_size(global.midi_notes_on) == 0)
		{
			show_debug_message("wahahahha");
			room_goto(rm_main); //go to main room
		}
		break;
}