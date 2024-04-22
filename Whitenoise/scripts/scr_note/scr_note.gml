// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//initialize for sound playback
function scr_init_notes()
{
	//global.sample_players = ds_list_create();
	global.players = array_create(128);
	global.player_gain = array_create(128, 0);
	global.player_state = array_create(128, -1); //dead -1, attack 0, sustain 1, decay 2
	/*for(var _i = 0; i < 128; i++)
	{
		var _new_player =
		{
			note : _i,
			sample : snd_square_c4,
			gain : 0,
			state : -1 //attack, sustain, decay
		}
	}*/
}

//play note
function scr_note_play(_note, _sample, _basepitch)
{
	var _adjusted_note = _note - _basepitch; //note offset based on pitch
	var _pitch = 1; //var to hold pitch adjustment
	_pitch = power(2, _adjusted_note/12)
	//var _new_player = ;
	//ds_list_insert(global.sample_players, _note, audio_play_sound(_sample, 1, true, 1, 0, _pitch));
	global.player_gain[_note] = 0;
	if(global.player_state[_note] == -1) //only create new player if player doesnt exist so we do not overwrite
		global.players[_note] = audio_play_sound(_sample, 1, true, global.player_gain[_note], 0, _pitch);
	global.player_state[_note] = 0; //set state to attack

}

//kill note
function scr_note_kill(_note)
{
	//set state to decay
	global.player_state[_note] = 2;
	//audio_stop_sound(global.players[_note]);
	/*
	var _player = ds_list_find_value(global.sample_players, _note);
	if(_player != noone)
		audio_stop_sound(_player);
	*/
}

//update adsr values for all players (step event)
function scr_note_adsr()
{
	show_debug_message(string(global.player_gain[60]));
	for(var _i = 0; _i < 128; _i++)
	{
		switch(global.player_state[_i])
		{
			case -1: //not playing
				break;
			case 0: //attack
				if(global.player_gain[_i] < 0.99)
				{
					global.player_gain[_i] = lerp(global.player_gain[_i], 1, 0.5);
				}
				else
				{
					global.player_gain[_i] = 1;
					global.player_state[_i] = 1;//hit sustain
				}
				break;
			case 1: //sustain
				global.player_gain[_i] = 1;
				break;
			case 2: //decay
				if(global.player_gain[_i] > 0.01)
				{
					global.player_gain[_i] = lerp(global.player_gain[_i], 0, 0.25);
				}
				else
				{
					audio_stop_sound(global.players[_i]);//kill player
					global.player_gain[_i] = 0; //reset gain value
					global.player_state[_i] = -1;//hit not playing
				}
				break;
		}
		//update gain on any players that are active
		if(global.player_state[_i] != -1)
		{
			audio_sound_gain(global.players[_i], global.player_gain[_i], 0); 
		}
	}
}