/*
Sends note off messages for the arpeggiator
*/
function sMIDIArpeggiatorStop(){
	var vnote;
	vnote = ds_list_find_value(notelist,noteposition)
	sMIDISendNoteOff(outchannel,vnote)
	noteon = 0
	
}