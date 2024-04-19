///@function sMIDIProcess()
/*Pulls all incoming MIDI messages, calculates clock
*/
function sMIDIProcess(){
	//pull incoming MIDI messages
	var b,i,listMessage,newtiming,timereset;
	newtiming = 0//if there are new timing messages to process
	timereset = 0
	b = rtmidi_check_message()
	while b > 0{
		listMessage = ds_list_create()
		for (i = 0; i < b; i += 1){
			ds_list_add(listMessage,rtmidi_get_message(i))
			}
		ds_list_add(global.midiinlist,listMessage)
		b = rtmidi_check_message()
		}
	//check and process messages immediately
	var vsize,vlist,vval;
	vsize = ds_list_size(global.midiinlist)
	for (i = vsize-1; i >= 0; i -= 1){
		vlist = ds_list_find_value(global.midiinlist,i)
		vval = ds_list_find_value(vlist,0)
		if vval <= 159{//note on or off
			var vnote,vpos;
			vnote = ds_list_find_value(vlist,1)
			if vval <= 143{//note off
				if vval - 128 = inchannel{//on input channel
					
					vpos = ds_list_find_index(notepressedlist,vnote)
					if vpos >= 0{
						ds_list_delete(notepressedlist,vpos)
						}
					}
				}else{//note on
				if vval - 144 = inchannel{//on input channel
					if ds_list_find_index(notepressedlist,vnote) < 0{
						ds_list_add(notepressedlist,vnote)
						}
					}
				}
			}else{
			switch vval{
				case 248://timing pulse
					newtiming = 1;
					;break;
				case 250://timing start
					timereset = 1;
					if useinternalclock = 0{
						rtmidi_send_message(250,-1,-1)
						}
					;break;
				case 252://timing stop
					timereset = 1;
					if useinternalclock = 0{
						rtmidi_send_message(252,-1,-1)
						}
					;break;
				}
			if newtiming = 1{//if there are incoming timing pulses to process
				sMIDIReceiveClock()
				}
			if timereset = 1{//clear the pulse time list if using external clock source
				ds_list_clear(global.miditimelist)
				global.midipulsenum = 0
				global.midipulsetimeprev = -1
				}
			}
		//delete the message after evaluating
		ds_list_delete(global.midiinlist,i)
		ds_list_destroy(vlist)
		}
	//if using the internal clock, calculate it now
	if useinternalclock = 1{
		if global.midipulsenum = 0{
			onbeat = 1
			}
		var ptime;
		ptime = get_timer()-global.clockprevtime
		global.clockpulsetimer += ptime
		global.clockprevtime = get_timer()
		if global.clockpulsetimer > global.clockpulsetime{
			global.midipulsenum += 1
			global.clockpulsetimer -= global.clockpulsetime//account for any additional time
			if sendclock = 1{
				rtmidi_send_message(248,-1,-1)
				}
			}
		if global.midipulsenum >= global.clockpulses{
			global.midipulsenum = 0
			}
		}
	//monitor if the clock is at a pulse we need to do something with
	if global.midipulsenum != global.clockprevpulse{
		//check if we're on the arpeggiator step
		var vclock;
		vclock = global.midipulsenum//save to do maths to it
		if vclock/arpclockdiv = floor(vclock/arpclockdiv){//arpeggiator step
			sMIDIArpeggiatorStep()
			}
		vclock -= notelength
		if vclock/arpclockdiv = floor(vclock/arpclockdiv){//arpeggiator note off
			sMIDIArpeggiatorStop()
			}
		}
	global.clockprevpulse = global.midipulsenum
}
