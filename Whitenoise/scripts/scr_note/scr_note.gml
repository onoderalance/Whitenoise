// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

//initialize for sound playback
function scr_init_notes()
{
	global.sample_players = ds_list_create();
	global.players = array_create(128);
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
	global.players[_note] = audio_play_sound(_sample, 1, true, 1, 0, _pitch);
}

//kill note
function scr_note_kill(_note)
{
	audio_stop_sound(global.players[_note]);
	/*
	var _player = ds_list_find_value(global.sample_players, _note);
	if(_player != noone)
		audio_stop_sound(_player);
	*/
}