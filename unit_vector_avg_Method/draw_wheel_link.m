function wheel_position = draw_wheel_link(joint_pos,point1,point2,joint_angle)

wheel_theta = 0:0.01:2*pi;
wheel_radious = 75;

updated_point1 = rotation(joint_angle)*point1;
updated_point1_ = updated_point1 + joint_pos;

updated_point2 = rotation(joint_angle)*point2;
updated_point2_ = updated_point2 + joint_pos;

wheel_point = updated_point2_ + rotation(joint_angle)*wheel_radious*[cos(wheel_theta);zeros(1,length(wheel_theta));sin(wheel_theta)];

plot3(updated_point2_(1),updated_point2_(2),updated_point2_(3),'-o')
hold on;
plot3(wheel_point(1,:),wheel_point(2,:),wheel_point(3,:));

line([joint_pos(1),updated_point1_(1)],[joint_pos(2),updated_point1_(2)],[joint_pos(3),updated_point1_(3)])
line([updated_point1_(1),updated_point2_(1)],[updated_point1_(2),updated_point2_(2)],[updated_point1_(3),updated_point2_(3)])

wheel_position = updated_point2_;