/// @description Insert description here
// You can write your code in this editor
var _color = make_colour_rgb(234, 247, 255);

//is this the right approach? feels claustrophobic...
if(m_borders_offset > m_border_final_offset)
{
	m_borders_offset -= 6;
}

//left rectangle
draw_rectangle_color(0, 0, m_borders_offset, room_height, _color, _color, _color, _color, false);

//right rectangle
draw_rectangle_color(room_width-m_borders_offset, 0, room_width, room_height, _color, _color, _color, _color, false);


m_border_fade_in_opacity = lerp(m_border_fade_in_opacity, 0, 0.05);

//draw overlay white

draw_set_alpha(m_border_fade_in_opacity);
show_debug_message(m_border_fade_in_opacity);
draw_rectangle_color(0, 0, room_width, room_height, _color, _color, _color, _color, false);
draw_set_alpha(1);

