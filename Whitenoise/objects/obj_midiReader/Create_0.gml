/// @description Insert description here
// You can write your code in this editor

//initialize midi to first port
rtmidi_init();

//show_debug_message("what " + string(rtmidi_probe_ins())); 
rtmidi_set_inport(0);

//holds current midi value? idfk how midi works help help help help
//global.current_midi = -1;

global.midi_messages = ds_list_create();

