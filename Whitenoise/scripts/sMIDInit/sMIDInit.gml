///@function sMIDIInit()
/*
Creates the data structures and variables that will be used to send and receive MIDI data. This does not 
initialize the RtMidi DLL!
*/
function sMIDIInit(){
	global.midiinlist = ds_list_create()//a list of incoming MIDI messages to process
	global.miditimelist = ds_list_create()//list of previous times between pulses, in microseconds
	global.mididifferencelist = ds_list_create()//the difference between incoming timing pulses
	global.midipulsetimeprev = -1
	global.midipulsenum = 0//how many clock pulses have come in, reset to 0 at 24
	global.midibpm = 120//the incoming BMP
	global.mididisplaybpm = 120//the shown MIDI BPM, average of the last several calculated beats
	global.midibpmlist = ds_list_create()//last few BPMs
	global.midiprevtime = 0	
	global.midiaveragedifference = 0
}