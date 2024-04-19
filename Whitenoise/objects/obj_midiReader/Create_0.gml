/// @description Insert description here
// You can write your code in this editor

//holds current midi value? idfk how midi works help help help help
global.current_midi = -1;

global.midi_messages = ds_list_create();

//initialize midi to first port
rtmidi_init();
rtmidi_set_inport(1);