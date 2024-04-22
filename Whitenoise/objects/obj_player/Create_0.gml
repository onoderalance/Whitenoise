/// @description Insert description here
// You can write your code in this editor

//right above the rock
depth = -1001;

image_xscale = 0.5;
image_yscale = 0.5;

//initialize out of bounds
x = room_width/2;
y = 0 - sprite_height*2;

//player position ranges from 0-11 currently, based on one octave of midi
m_player_last_note = -1;

m_player_target_x = x;
m_player_target_y = 300;

