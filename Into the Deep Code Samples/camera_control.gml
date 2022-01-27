
zoom_effect = speed_delta / 150;

if (instance_exists(weakpoint_interior)) {
	if (point_distance(x,y,weakpoint_interior.x,weakpoint_interior.y) < 2500) {
		zoom_effect *= 3;	
	}
}

//Move the zoom level based on mouse scrolling. Clamp the value so stuff doesn't get too silly.
zoom_level = clamp(zoom_level + (speed_delta / 75), 0.1, 9);

//Get current size
var view_w = camera_get_view_width(view_camera[0]);
var view_h = camera_get_view_height(view_camera[0]);

//Set the rate of interpolation
var rate = 0.2;

//Get new sizes by interpolating current and target zoomed size
var new_w = lerp(view_w, zoom_level * default_zoom_width, rate);
var new_h = lerp(view_h, zoom_level * default_zoom_height, rate);

//Apply the new size
camera_set_view_size(view_camera[0], new_w, new_h);




//var cameraposx = x  - (view_wport[0] / 2) + xvel * 3.5;
//var cameraposy = y - (view_hport[0] / 2) + yvel * 3.5;

var shift_x = x - (new_w / 2) + xvel * 16; // boost_shake_severity;
var shift_y = y - (new_h / 2) + yvel * 16; // boost_shake_severity;
camera_set_view_pos(view_camera[0],shift_x, shift_y);

var camerashake = force;
if (screenshake_duration > 0 or boosted = true) {
	camerashake += screenshake_severity + boost_shake_severity;
	screenshake_duration--;
	if (screenshake_duration <= 0) { screenshake_severity = 1; }
	boost_shake_severity -= boost_shake_deccel;
	boost_shake_severity = clamp(boost_shake_severity,boost_shake_min,boost_shake_max);
}
shift_x += random_range(0, camerashake);
shift_y += random_range(0, camerashake);
camera_set_view_pos(view_camera[0],shift_x, shift_y);