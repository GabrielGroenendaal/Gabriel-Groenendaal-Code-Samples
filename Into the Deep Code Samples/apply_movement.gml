// apply_movement()

// FLUCTUATION
if (!(keyboard_check(vk_right)) and !(keyboard_check(vk_left))) {
	right_angle_fluctuation *= .005;
} 

if (jetpack_right.active and jetpack_left.active) {
	angle_drag = .85;
	force *= 1.1;
	
	if (boosted = false) {
		boost_shake_severity = boost_shake_max;
		gain = 1;
		
		boosted = true;
		jetpack_left.pitch = .1;
		jetpack_right.pitch = .1;
		force += 1;
	}
} else { 
	angle_drag = .975; 
	force *= .85; 
	boost_shake_severity = boost_shake_max; 
	boosted = false; 
	gain -= .1;
}

// ANGLE CHANGE
angle *= angle_drag;
angle = clamp(angle, -angle_maxspeed, angle_maxspeed);
angle += right_angle_fluctuation; 
image_angle += angle;

// POSITION CHANGE
xvel *= random_range(.99,1.01);
yvel *= random_range(.99,1.01);
xvel += cos(degtorad(image_angle)) * force;
yvel -= sin(degtorad(image_angle)) * force;
xvel *= move_drag; 
yvel *= move_drag; 
xvel = clamp(xvel, -xmax, xmax);
yvel = clamp(yvel, -ymax, ymax);

// APPLY MOVEMENT
x += xvel; 
y += yvel + grav;

// WRAPPING
move_wrap(true,true,sprite_height);

// CHECK COLLISION
/*
if (speed_n < 30) { 
	collide_x(layer,xvel);
	collide_y(layer,yvel);
}