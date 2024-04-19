/// @description Insert description here
// You can write your code in this editor

//tracks what portion of the main menu we are at (getting octaves)
m_menu_stage = 0;
m_menu_next_stage = 0;

//tracks current midi note being held
m_menu_note_held = false;
m_menu_note = -1;

//timer for moving to the next stage
m_menu_next_stage_timer = -1;

//opacity of text on screen
m_menu_text_opacity = 1;

//opacity of white screen
m_menu_white_opacity = 0;

//handles the moving of elements off the screen
m_menu_y_offset = 0;