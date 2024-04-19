/// @description Insert description here
// You can write your code in this editor

//draw title text
draw_set_font(fnt_title);
draw_set_color(c_black);
draw_set_halign(fa_center);
draw_text(room_width/2, room_height/4, "whitespace");

var _option_string = "";

switch(m_menu_stage)
{
	case 0: //initial keyboard test
		_option_string = "press any key."
		break;
	case 1: //octave 1
		break;
	case 2: //octave 2
		break;
	case 3: //ready to enter game!
		break;
}

draw_set_font(fnt_options);
draw_text(room_width/2, room_height*3/4, _option_string);