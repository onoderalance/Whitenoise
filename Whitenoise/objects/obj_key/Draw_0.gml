/// @description Insert description here
// You can write your code in this editor

//draw base self
draw_self();

//draw if harmony
for(var _j = 0; _j < ds_list_size(global.midi_notes_on); _j++)
{
	if(global.midi_notes_on[|_j] == global.octave_harmony*12+m_key_note)
	{
		draw_sprite_ext(spr_key, 0, x, y, 1, 1, 0, c_green, 0.25);
	}
}

//draw if melody
for(var _j = 0; _j < ds_list_size(global.midi_notes_on); _j++)
{
	if(global.midi_notes_on[|_j] == global.octave_melody*12+m_key_note)
	{
		draw_sprite_ext(spr_key, 0, x, y, 1, 1, 0, c_aqua, 0.5);
	}
}