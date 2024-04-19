/// @description Insert description here
// You can write your code in this editor

//determines player position based on player_position variable

if(ds_list_size(global.midi_messages) > 0)
{
	show_debug_message("GOOGOO");
	for(var _i = 0; _i < ds_list_size(global.midi_messages); _i++)
	{
		if(global.midi_messages[|_i][|0] == 144)//on signal
		{
			if(floor(global.midi_messages[|_i][|1]/12) == global.octave_harmony)
			{
				show_debug_message("NEW ROCK SPAWNED");
				show_debug_message(string(510+(global.midi_messages[|_i][|1]%12)*75));
				var _new_rock = instance_create_depth(510+(global.midi_messages[|_i][|1]%12)*75, room_height, -1000, obj_rock);
				_new_rock.image_xscale = 0.25;
				_new_rock.image_yscale = 0.25;
			}
		}
	}
}

