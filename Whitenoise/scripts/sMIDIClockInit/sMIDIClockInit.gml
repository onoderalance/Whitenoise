///@function sMIDIClockInit()
/*Creates the initial variables and parameters for using an internal clock source.
*/
function sMIDIClockInit(){
	global.clockbpm = 120
	global.clockbeattime = (60/global.clockbpm)*1000000//the amount of time in microseconds for one beat to happen
	global.clockpulses = 24//the number of pulses per beat, MIDI standard is 24
	global.clockpulsetime = global.clockbeattime/global.clockpulses//pulse interval in microseconds
	global.clockpulsetimer = 0
	global.clockprevtime = 0
	global.clockprevpulse = -1//used to track when the clock changes
}