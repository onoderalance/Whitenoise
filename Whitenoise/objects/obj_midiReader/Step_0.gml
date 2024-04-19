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
	_list_message = ds_list_create()	
	for (_i = 0; _i < _b; _i++)
	{	
		ds_list_add(_list_message, rtmidi_get_message(_i))		
	}
	
	ds_list_add(global.midi_messages, _list_message)	
	_b = rtmidi_check_message()	
}

//show_debug_message(ds_list_size(global.midi_messages));