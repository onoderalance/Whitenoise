/// @description Insert description here
// You can write your code in this editor

//STEP EVENT, based on sample code in documentation
var _b, _i, _list_message;

//midiMessages is a ds_list that was created previously, and holds all MIDI messages that came in on this step
ds_list_clear(global.midi_messages);

_b = rtmidi_check_message();

while(_b > 0) 
{
	//show_debug_message(string(_b));
	_list_message = ds_list_create();
	for (_i = 0; _i < _b; _i++)
	{	
		ds_list_add(_list_message, rtmidi_get_message(_i))	;	
	}
	
	ds_list_add(global.midi_messages, _list_message);	
	_b = rtmidi_check_message()	;
}

//all midi_messages sent this step are are in the midi_messages list, now parse for signals
for(_i = 0; _i < ds_list_size(global.midi_messages); _i++)
{
	//note on messages
	if(global.midi_messages[|_i][|0] == 144)
	{
		/*//play note first
		var _note = global.midi_messages[|_i][|1] - 65; //note offset based on 65 or F4
		var _pitch = 1; //var to hold pitch adjustment
		_pitch = power(2, _note/12)
		audio_play_sound(snd_synth_f4, 1, false, 1, 0, _pitch);
		*/
		
		//then add it to the ON list
		var _found_note = false;
		for(var _j = 0; _j < ds_list_size(global.midi_notes_on) && !_found_note; _j++)
		{
			if(global.midi_notes_on[|_j] == global.midi_messages[|_i][|1])
			{
				
				//found the note in the list already
				_found_note = true;
			}
		}
		if(!_found_note) //if note is not already in the list, add it to the list
		{
			//call script to play note
			scr_note_play(global.midi_messages[|_i][|1], snd_square_c4, 60);	
			//adds new velocity to array, divided by 127 to get accurate val as portion of 1
			global.player_velocity[global.midi_messages[|_i][|1]] = global.midi_messages[|_i][|2]/127;
			show_debug_message("VELOCITY:");
			show_debug_message(global.player_velocity[_i]);
			
			ds_list_add(global.midi_notes_on, global.midi_messages[|_i][|1]);
		}
	}
	//note off messages
	if(global.midi_messages[|_i][|0] == 128)
	{
		var _found_note = false;
		for(var _j = 0; _j < ds_list_size(global.midi_notes_on) && !_found_note; _j++)
		{
			if(global.midi_notes_on[|_j] == global.midi_messages[|_i][|1])
			{
				scr_note_kill(global.midi_messages[|_i][|1]);
				//found the note in the list, remove it
				ds_list_delete(global.midi_notes_on, _j);
				_found_note = true;
			}
		}
	}
}

//debug print for all notes in the "on" list
show_debug_message("all notes:");
for(var _j = 0; _j < ds_list_size(global.midi_notes_on); _j++)
{
	show_debug_message(global.midi_notes_on[|_j]);
}
//show_debug_message(ds_list_size(global.midi_messages));

//update adsr
scr_note_adsr();