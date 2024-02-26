///@function sMIDIClockSetBPM()
/*Creates the initial variables and parameters for using an internal clock source.
*/
function sMIDIClockSetBPM(bpm){
	global.clockbpm = bpm
	global.clockbeattime = (60/global.clockbpm)*1000000//the amount of time in microseconds for one beat to happen
	global.clockpulsetime = global.clockbeattime/global.clockpulses//pulse interval in microseconds
	global.mididisplaybpm = global.clockbpm
	global.clockpulsetimer = 0
}