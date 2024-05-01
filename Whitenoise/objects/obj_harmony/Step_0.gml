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
				var _new_obstacle = instance_create_depth(510+(global.midi_messages[|_i][|1]%12)*75, room_height, -1000, obj_obstacle);
				_new_obstacle.image_xscale = 0.5;
				_new_obstacle.image_yscale = 0.5;
				var _interval = global.midi_messages[|_i][|1] - global.midi_root;
				if(_interval < 0)
				{
					//if interval is negative, add an octave to calculate the real interval
					_interval += 12;
				}
				_new_obstacle.m_obstacle_index = _interval;
			}
		}
	}
}

