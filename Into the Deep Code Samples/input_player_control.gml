// input_option_b_simple

// this input scheme is meant to be similar to the basic input scheme, with a few key differences

// right input
if (keyboard_check(vk_right) or keyboard_check(ord("D")) or mouse_check_button(mb_right) or gamepad_button_check(0,gp_shoulderrb)) {
	jetpack_right.active = true;
	
	thrust_right += thrust_accel;
	thrust_right = clamp(thrust_right, thrust_min, thrust_max);
	force += thrust_right;
	
	angle_right += angle_accel;
	angle_right = clamp(angle_right, angle_min, angle_max);
	angle += angle_right; 
} else { 
	jetpack_right.active = false; 
	thrust_right -= thrust_min / 500; 
	angle_right -= angle_min / 500;
}

// LEFT INPUT
if (keyboard_check(vk_left) or keyboard_check(ord("A")) or mouse_check_button(mb_left) or gamepad_button_check(0,gp_shoulderlb)) {
	jetpack_left.active = true;
	
	thrust_left += thrust_accel;
	thrust_left = clamp(thrust_left, thrust_min, thrust_max);
	force += thrust_left;
	
	angle_left += angle_accel;
	angle_left = clamp (angle_left, angle_min, angle_max);
	angle += angle_left * -1;
} else { 
	jetpack_left.active = false;
	thrust_left -= thrust_min / 500;
	angle_left -= angle_min / 500;
}



// DRIFT
/*if (keyboard_check_pressed(vk_space)) {
	drift_deccel = .6;
	//drift_accel = 1.5;
	//screen_shake(force);
} 
if (keyboard_check_released(vk_space)){
	drift_deccel = 1;
	//drift_accel = 1;
	boost(2,1.4);
} 

