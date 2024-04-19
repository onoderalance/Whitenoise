/// @description Insert description here
// You can write your code in this editor

//draw title text
draw_set_font(fnt_title);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(room_width/2, room_height/4+m_menu_y_offset, "whitespace");

var _option_string = "";

switch(m_menu_stage)
{
	case 0: //initial keyboard test
		_option_string = "press any key."
		break;
	case 1: //octave 1
		_option_string = "press any key in harmony octave."
		break;
	case 2: //octave 2
		_option_string = "press any key in melody octave."
		break;
	case 3: //ready to enter game!
		_option_string = "play a note in both octaves to begin."
		break;
}

//draw optionstring
draw_set_font(fnt_options);
draw_text_color(room_width/2, room_height*3/4+m_menu_y_offset, _option_string, c_black, c_black, c_black, c_black, m_menu_text_opacity);

//draw overlay white
var _color = make_colour_rgb(234, 247, 255);
draw_set_alpha(m_menu_white_opacity);
draw_rectangle_color(0, 0, room_width, room_height, _color, _color, _color, _color, false);
draw_set_alpha(1);