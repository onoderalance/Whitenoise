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