/// @description GUI stuff
// You can write your code in this editor

var vx1,vy1,vx2,vy2



if mouse_check_button_pressed(mb_left){
	//in/outport
	if mouse_y >= inportboxy and mouse_y <= inportboxy+inportboxheight{
		if mouse_x >= inportboxx{
			if mouse_x >= outportboxx{//outport clicked
				outport += 1
				if outport >= outports{
					outport = 0
					}
				rtmidi_set_outport(outport)
				}else{
				inport += 1
				if inport >= inports{
					inport = 0
					}
				rtmidi_set_inport(inport)
				}
			}
		}
	//clock source
	vx1 = clocksourceboxx
	vy1 = clocksourceboxy
	vx2 = vx1+clocksourceboxwidth
	vy2 = vy1+clocksourceboxheight
	if point_in_rectangle(mouse_x,mouse_y,vx1,vy1,vx2,vy2){
		if useinternalclock = 1{
			useinternalclock = 0
			}else{
			useinternalclock = 1
			sMIDIClockSetBPM(global.mididisplaybpm)
			}
		}
	if useinternalclock = 1{
		vx1 = bpmboxx-20
		vy1 = bpmboxy
		vx2 = bpmboxx+bpmboxwidth+20
		vy2 = bpmboxy+bpmboxheight
		if point_in_rectangle(mouse_x,mouse_y,vx1,vy1,vx2,vy2){
			var vtime;
			vtime = global.clockbpm
			if mouse_x < bpmboxx + (bpmboxwidth/2){
				if vtime > 30{
					vtime -= 5
					sMIDIClockSetBPM(vtime)
					}
				}else{
				if vtime < 400{
					vtime += 5
					sMIDIClockSetBPM(vtime)
					}
				}
			}
		}
	//MIDI in and out channels
	vx1 = inchannelboxx
	vy1 = inchannelboxy
	vx2 = inchannelboxx+inchannelboxwidth
	vy2 = inchannelboxy+inchannelboxheight
	if point_in_rectangle(mouse_x,mouse_y,vx1,vy1,vx2,vy2){
		inchannel += 1
		if inchannel > 15{
			inchannel = 0
			}
		}
	vx1 = outchannelboxx
	vy1 = outchannelboxy
	vx2 = outchannelboxx+outchannelboxwidth
	vy2 = outchannelboxy+outchannelboxheight
	if point_in_rectangle(mouse_x,mouse_y,vx1,vy1,vx2,vy2){
		outchannel += 1
		if outchannel > 15{
			outchannel = 0
			}
		}
	//note time 
	vx1 = arpdivboxx
	vy1 = arpdivboxy
	vx2 = vx1 + arpdivboxwidth
	vy2 = vy1 + arpdivboxheight
	if point_in_rectangle(mouse_x,mouse_y,vx1,vy1,vx2,vy2){
		arpdivindex += 1
		if arpdivindex > 3{
			arpdivindex = 0
			}
		notelength = 3
		switch arpdivindex{
			case 0: arpclockdiv = 24; break;
			case 1: arpclockdiv = 12; break;
			case 2: arpclockdiv = 6; break;
			case 3: arpclockdiv = 3; notelength = 1; break;//for 32nd notes, the length must be less than 3 clock pulses or we send
			//simultaneous note on and note off
			}
		}
	}