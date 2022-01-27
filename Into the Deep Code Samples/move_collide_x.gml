var new_x = x;
var bounce_amt = 2;
var hit = 0;
for	(var i = 0; i < abs(xvel); i++) {	
	new_x += sign(xvel);
	if (place_meeting(new_x, y, wall)) {
		var hit_wall = instance_place(new_x, y, wall);
		new_x -= sign(xvel);

		var wall_norm = hit_wall.image_angle - 90;
		if (right_of_line(hit_wall.x, 
						  hit_wall.y,
						  hit_wall.x + cos(degtorad(hit_wall.image_angle)) * 1000, 
						  hit_wall.y - sin(degtorad(hit_wall.image_angle)) * 1000)) {
			wall_norm += 180;
		}
		wall_norm = degtorad(wall_norm);
		var dot = dot_product(xvel, yvel, cos(wall_norm+pi), -sin(wall_norm+pi));
		xvel += cos(wall_norm) * dot * bounce_amt;
		yvel -= sin(wall_norm) * dot * bounce_amt;
		hit = 1;
		show_debug_message("hit x");
		break;
	}
}
x = new_x;

var new_y = y;

for	(var i = 0; i < abs(yvel); i++) {	
	new_y += sign(yvel);
	if (place_meeting(x, new_y, wall)) {

		var hit_wall = instance_place(x, new_y, wall);
		new_y -= sign(yvel);

		var wall_norm = hit_wall.image_angle - 90;
		if (right_of_line(hit_wall.x, 
						  hit_wall.y,
						  hit_wall.x + cos(degtorad(hit_wall.image_angle)) * 1000, 
						  hit_wall.y - sin(degtorad(hit_wall.image_angle)) * 1000)) {
			wall_norm += 180;
		}
		wall_norm = degtorad(wall_norm);
		var dot = dot_product(xvel, yvel, cos(wall_norm+pi), -sin(wall_norm+pi));
		xvel += cos(wall_norm) * dot * bounce_amt;
		yvel -= sin(wall_norm) * dot * bounce_amt;
		hit = 1;
		break;
	}
}
y = new_y;