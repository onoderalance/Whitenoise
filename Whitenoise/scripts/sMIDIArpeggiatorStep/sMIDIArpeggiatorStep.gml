///@function sMIDIArpeggiatorStep()
/*Processes the arpeggiator, called once each time the clock pulse hits the proper number
Adds or subtracts notes from the notelist, and plays the next note. Notes are stopped by
sMIDIArpeggiatorStop()
*/
function sMIDIArpeggiatorStep(){
	
	var vpos,vnote,vsize,i;
	vsize = ds_list_size(notelist)
	
	//go through notelist and make sure each note is still pressed
	
	for(i = vsize-1; i >= 0; i -= 1){
		vnote = ds_list_find_value(notelist,i)
		if ds_list_find_index(notepressedlist,vnote) < 0{//if it's not pressed
			vpos = ds_list_find_index(notelist,vnote)
			ds_list_delete(notelist,vpos)
			if vpos < noteposition{
				noteposition -= 1
				}
			//ensure note off was sent
			sMIDISendNoteOff(outchannel,vnote)
			}
		}
	
	//go through notepressedlist and add any that aren't already on notelist
	
	vsize = ds_list_size(notepressedlist)
	for (i = 0; i < vsize; i += 1){
		vnote = ds_list_find_value(notepressedlist,i)
		if ds_list_find_index(notelist,vnote) < 0{
			ds_list_add(notelist,vnote)
			ds_list_sort(notelist,true)
			vpos = ds_list_find_index(notelist,vnote)
			if vpos <= noteposition{
				noteposition += 1
				}
			}
		}
	
	switch notedirection{
		case 0://down
			noteposition -= 1; break;
		case 1://up
			noteposition += 1; break;
		}
	vsize = ds_list_size(notelist)
	if vsize > 0{//if there are any notes to play
		if arpplayedlast = 1{//if we previously played, cycle through the notes as usual
			vsize = max(ds_list_size(notelist),1)
			if noteposition < 0{
				noteposition = 1
				notedirection = 1
				}
			if noteposition >= vsize{
				noteposition = vsize-2
				notedirection = 0
				}
			noteposition = clamp(noteposition,0,vsize-1)
			}else{
			//otherwise, always start at the lowest note and ascend
			noteposition = 0
			notedirection = 1
			}
		//play the note
		vnote = ds_list_find_value(notelist,noteposition)
		sMIDISendNoteOn(outchannel,vnote,127)
		noteon = 1
		arpplayedlast = 1
		}else{
		arpplayedlast = 0
		}
	
}