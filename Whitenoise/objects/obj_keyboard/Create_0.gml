/// @description Insert description here
// You can write your code in this editor

//create and populate keys
m_keyboard_key_list = ds_list_create();
for(var _i = 0; _i < 12; _i++)
{
	var _new_key = instance_create_depth(510+_i*75, y, -1000-_i, obj_key);
	_new_key.m_key_note = _i;
	_new_key.m_key_create_timer = 60+_i*5;
	ds_list_add(m_keyboard_key_list, _new_key);
}