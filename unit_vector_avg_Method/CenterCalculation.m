function center_position = CenterCalculation(wheel_avg_position,roll,pitch)

R_x = rotation_x(roll);
R_y = rotation_y(pitch);

center_position = - (R_x*R_y)'*wheel_avg_position;

end

