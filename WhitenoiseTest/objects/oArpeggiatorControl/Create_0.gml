/// @description Insert description here
// You can write your code in this editor

var i,j;

/*At 60 FPS, checking the MIDI clock once per step can result in a delay as great as 17ms between the reception of data at the port
and the reception of data in GMS. To get around this, we'll set the game speed to 600 steps, letting us check the MIDI queue 
roughly every 0.833ms, and only run the draw event every 10 steps, letting us keep 60FPS. In practice, this lowers the typical
time discrepancy between when MIDI information is received at the port and when it's received in GMS to 0.5-1ms - you can
check this on your own system with the variable global.midiaveragedifference when using an external clock source, it keeps
track of the difference in the length of time between received timing pulses. I found I could go as low as 240 steps per second and
still keep timing discrepancies under 5ms, an acceptable lag in most cases.
*/

/*draw enabling/disabing is handled in the end step event. It can be done with alarms, but for reasons probably related
to the unknowable way GMS optimizes stuff, I get much tighter timing handling it manually.*/

draw_enable_drawevent(0)
gamespeed = 600
game_set_speed(gamespeed,gamespeed_fps)
drawsteps = round(gamespeed/60)
stepsdone = 0



//initialize rtmidi, creating rtmidiin and rtmidiout
j = rtmidi_init()

//sMIDIInit is different from rtmidi_init, setting up the internal variables instead of initializing the actual
//MIDI system
sMIDIInit()



outports = rtmidi_probe_outs()
inports = rtmidi_probe_ins()
inchannel = 0//the channel to listen for MIDI messages on
outchannel = 0// channel to send MIDI messages on
alarm[0] = 240

outportstringlist = ds_list_create()

if outports > 0{
	for (i = 0; i < outports; i += 1){
		ds_list_add(outportstringlist,rtmidi_name_out(i))
		}
	}
	
inportsstringlist = ds_list_create()
if inports > 0{
	for (i = 0; i < inports; i += 1){
		ds_list_add(inportsstringlist,rtmidi_name_in(i))
		}
	}


rtmidi_ignore_messages(true,false,true)

var n,m;

outport = ds_list_size(outportstringlist)-1
inport = 0
//the output port must be set before messages can be sent
n = rtmidi_set_outport(outport)
//the input port must also be set before messages can be received
m = rtmidi_set_inport(inport)


/*at 60 frames per second, we're looking at as many as 17 milliseconds of lag between receiving input
and processing it. In many contexts, especially ones heavily dependent on an accurate clock, this is
far too long. To reduce this, we spend as much extra time as possible between the step and drawing
events processing MIDI data and computing clock. Depending on the computer and context, this lets us 
reduce lag to 2-6ms. If we had long, complicated step or draw events, it wouldn't hurt to call 
sMIDIProcess a few times in the middle of those events as well, but that's not necessary here.
*/
processtime = 5000//how many microseconds to process spend processing MIDI events, twice per step
minfps = 100//how low to allow fps_real to drop to while processing MIDI messages
maxfps = 150//how high fps_real is allowed to get before dedicating more time to MIDI

onbeat = 0//if this step is on the beat

useinternalclock = 1//use internal clock or clock input
sendclock = 0//if received clock should be passed

sMIDIClockInit()

//arpeggiator stuff
//our simple arpeggiator will always play 16th notes, four times per clock
//it will also always play up then down. Hello, Stranger Things theme!
arpclockdiv = 6//We want 16th notes, i.e. 4 notes per beat. 24pulses/4 = 6
notelist = ds_list_create()//notes to play in the arpeggiator
notepressedlist = ds_list_create()//list of notes currently pressed
notelength = 3//this is the number of clock pulses to play the note for. 3 clock pulses is 1/32, so there will be
//equal note on and off times.
notedirection = 1//1 up, 0 down
noteposition = 0//the note in notelist to play
arpplayedlast = 0//if the arpeggiator played last time

arpdivindex = 2
/*
0: 1/4
1: 1/8
2: 1/16
3: 1/32
*/


noteon = 0//debug

//GUI
inportboxx = 10
inportboxy = 30
inportboxwidth = 150
inportboxheight = 25

outportboxx = 185
outportboxy = 30
outportboxwidth = 150
outportboxheight = 25

clocksourceboxx = 10
clocksourceboxy = 80
clocksourceboxwidth = 70
clocksourceboxheight = 30

bpmboxx = 100
bpmboxy = 80
bpmboxwidth = 30
bpmboxheight = 30

inchannelboxx = 170
inchannelboxy = 80
inchannelboxwidth = 30
inchannelboxheight = 30

outchannelboxx = 240
outchannelboxy = 80
outchannelboxwidth = 30
outchannelboxheight = 30

arpdivboxx = 300
arpdivboxy = 80
arpdivboxwidth = 30
arpdivboxheight = 30


show_debug_overlay(true)


