/// @description Insert description here
// You can write your code in this editor


//initialize midi to first port
rtmidi_init();

//show_debug_message("what " + string(rtmidi_probe_ins())); 
rtmidi_set_inport(0);

//initializes global array of midi audio palyers
scr_init_notes();

//holds current midi value? idfk how midi works help help help help
//global.current_midi = -1;

//holds global midi messages
global.midi_messages = ds_list_create();
//holds all notes currently set to "on"
global.midi_notes_on = ds_list_create();

//stores midi offset indices for harmony and melody octaves chosen by player
global.octave_harmony = -1;
global.octave_melody = -1;



