///@function sMIDIReceiveClock
/*Called by sMIDIProcess when a clock pulse is received and we're syncing to external clocks.
Broken into a separate function for readability
*/
function sMIDIReceiveClock(){
if useinternalclock = 0{//if using an external clock
	if sendclock = 1{//pass along the pulse
		rtmidi_send_message(248,-1,-1)
		}
	if global.midipulsetimeprev = -1{//if it's the first timing pulse
		global.midipulsetimeprev = 0
		}else{
		var ftime;
		ftime = get_timer()-global.midiprevtime
		global.midipulsetimeprev = ftime
		global.midiprevtime = get_timer()
		ds_list_insert(global.miditimelist,0,ftime)
		if ds_list_size(global.miditimelist) > 24{//keep the list at 24 entries
			ds_list_delete(global.miditimelist,24)
			}
		}
	//there are 24 pulses per quarter note, so a sigle beat's time is the space between pulses times 24.
	//Since GMS doesn't let us be super-precise about timing, we'll average the last few pulse intervals
	//This isn't a perfect solution since it gives a lag during tempo changes, but that can be mitigated
	//by using actual pulse reception for things like advancing a sequencer
	var vtime,beattime;
	if global.midipulsenum = 0{
		onbeat = 1
		}
	global.midipulsenum += 1
	//24 pulses per quarter note, keep track of how many pulses have been sent and re-sync
	var j, gsize,bsize;
	gsize = ds_list_size(global.miditimelist)
	bsize = 0
			
	if global.midipulsenum > 23{
		global.midipulsenum = 0
		}else{
		//only use the last 4 pulses generally
		if gsize > 6{
			gsize = 6
			}
		}
			
	b = 0
	for (j = 0; j < gsize; j += 1){
		b += ds_list_find_value(global.miditimelist,j)
		}
	vtime = round(b/gsize)//the pulse time in microseconds
	beattime = vtime*24//the time of a single beat, according to the vtime
	var gtime,mtime;
	gtime = beattime/1000//beat time in milliseconds
	mtime = beattime/1000000//beat time in seconds
			
	global.midibpm = 60/mtime
	ds_list_insert(global.midibpmlist,0,global.midibpm)
	gsize = ds_list_size(global.midibpmlist)
	if gsize > 24{
		ds_list_delete(global.midibpmlist,gsize-1)
		gsize = ds_list_size(global.midibpmlist)
		}
	b = 0
	for (j = 0; j < gsize; j += 1){
		b += ds_list_find_value(global.midibpmlist,j)
		}
	global.mididisplaybpm = round(b/gsize)			
	//get average difference in time between pulses in microseconds
	//This tells us roughly how much time passes between a MIDI message being received at the port, and
	//being received by GMS.
	var vdiff;
	vdiff = 0
	if ds_list_size(global.miditimelist) > 2{
		vdiff = abs(ds_list_find_value(global.miditimelist,0) - ds_list_find_value(global.miditimelist,1))
		ds_list_add(global.mididifferencelist,vdiff)
				
		gsize = ds_list_size(global.mididifferencelist)
		if gsize > 10{
			ds_list_delete(global.mididifferencelist,0)
			gsize = 10
			}
		b = 0
		for (j = 0; j < gsize; j += 1){
			b += ds_list_find_value(global.mididifferencelist,j)
			}
		global.midiaveragedifference = b/gsize
		}
	
	}
}