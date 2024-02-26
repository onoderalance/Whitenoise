/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white)
draw_set_font(fontAuditorSmall)


draw_text(300,10,"FPS:"+string(fps))


var i,vstring;

	
//in and outport boxes
draw_text(inportboxx+5,inportboxy-20,"Inport:")
draw_rectangle(inportboxx,inportboxy,inportboxx+inportboxwidth,inportboxy+inportboxheight,1)
vstring = ds_list_find_value(inportsstringlist,inport)
draw_text(inportboxx+5,inportboxy+5,vstring)

draw_text(outportboxx+5,outportboxy-20,"Outport:")
draw_rectangle(outportboxx,outportboxy,outportboxx+outportboxwidth,outportboxy+outportboxheight,1)
vstring = ds_list_find_value(outportstringlist,outport)
draw_text(outportboxx+5,outportboxy+5,vstring)

//clock source box
draw_text(clocksourceboxx+5,clocksourceboxy-20,"Clock source:")
draw_rectangle(clocksourceboxx,clocksourceboxy,clocksourceboxx+clocksourceboxwidth,clocksourceboxy+clocksourceboxheight,1)
if useinternalclock = 1{
	vstring = "Internal"
	}else{
	vstring = "External"
	}
draw_text(clocksourceboxx+5,clocksourceboxy+5,vstring)

//BPM box
draw_text(bpmboxx+5,bpmboxy-20,"BPM")
draw_rectangle(bpmboxx,bpmboxy,bpmboxx+bpmboxwidth,bpmboxy+bpmboxheight,1)
draw_text(bpmboxx+5,bpmboxy+5,global.mididisplaybpm)
if useinternalclock = 0{
	draw_set_color(c_dkgray)
	}
draw_text(bpmboxx-9,bpmboxy+5,"<")
draw_text(bpmboxx+bpmboxwidth+5,bpmboxy+5,">")
draw_set_color(c_white)

draw_text(bpmboxx,bpmboxy+20,global.midiaveragedifference)

//channel
draw_text(inchannelboxx-5,inchannelboxy-20,"In channel")
draw_rectangle(inchannelboxx,inchannelboxy,inchannelboxx+inchannelboxwidth,inchannelboxy+inchannelboxheight,1)
draw_text(inchannelboxx+5,inchannelboxy+5,inchannel+1)

draw_text(outchannelboxx-5,outchannelboxy-20,"Out channel")
draw_rectangle(outchannelboxx,outchannelboxy,outchannelboxx+outchannelboxwidth,outchannelboxy+outchannelboxheight,1)
draw_text(outchannelboxx+5,outchannelboxy+5,outchannel+1)

//note
draw_text(arpdivboxx-5,arpdivboxy-20,"Note length")
draw_rectangle(arpdivboxx,arpdivboxy,arpdivboxx+arpdivboxwidth,arpdivboxy+arpdivboxheight,1)

switch arpdivindex{
	case 0: vstring = "1/4"; break;
	case 1: vstring = "1/8"; break;
	case 2: vstring = "1/16"; break;
	case 3: vstring = "1/32"; break;
	}
draw_text(arpdivboxx+5,arpdivboxy+5,vstring)


//draw current notes
draw_text(30,120,"Current notes")
var vsize,vx,vnote; 
vx = 30
vsize = ds_list_size(notelist)
for (i = 0; i < vsize; i += 1){
	vnote = ds_list_find_value(notelist,i)
	if i = noteposition{
		draw_set_color(c_red)
		}
	draw_text(vx,140,vnote)
	draw_set_color(c_white)
	vx += 30
	}
	
	