/// @description Insert description here
// You can write your code in this editor

//determines player position based on player_position variable

if(ds_list_size(global.midi_notes_on) > 0)
{
	for(var _i = 0; _i < ds_list_size(global.midi_notes_on); _i++)
	{
		if(floor(global.midi_notes_on[|_i]/12) == global.octave_melody)
		{
			m_player_last_note = global.midi_notes_on[|_i]%12;
			break;
		}
	}
}

if(m_player_last_note != -1)
	m_player_target_x = m_player_last_note*75+510;

if(m_player_target_x > x)
	image_xscale = -0.5;
if(m_player_target_x < x)
	image_xscale = 0.5;

//randomly change y pos for more fluidity
if(irandom_range(0, 60) == 1)
	m_player_target_y = random_range(300, 350);


//set position
x = lerp(x, m_player_target_x, 0.05);
y = lerp(y, m_player_target_y, 0.05);

