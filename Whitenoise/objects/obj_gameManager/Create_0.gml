/// @description Insert description here
// You can write your code in this editor

//debug my beloved, toggles to do stupid prints
global.debug = false;

//bpm value to scale speed off of
global.bpm = 120;
//global value for speed of objects scrolling upwards
global.speed = 755/60 * (global.bpm/120);
//global.speed = 10;

//starts looping wind sound NEVER ENDING
audio_play_sound(snd_wind_1, 1, true);

//set game to fullscreen
window_set_fullscreen(true);