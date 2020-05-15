function draw_plane(normal_vector,wheel_avg_position,roll,pitch)

x_max = 400;
y_max = 400;

x_min = -x_max;
y_min = -y_max;

[x y] = meshgrid(x_min:10:x_max);

z =  -(x-wheel_avg_position(1))*normal_vector(1)/normal_vector(3) - (y-wheel_avg_position(2))*normal_vector(2)/normal_vector(3) + wheel_avg_position(3);


% Wheel xyz axis
u_wheel_x = rotation_x(roll)*rotation_y(pitch)*[1;0;0];
u_wheel_y = rotation_x(roll)*rotation_y(pitch)*[0;1;0];
quiver3(wheel_avg_position(1),wheel_avg_position(2),wheel_avg_position(3),u_wheel_x(1),u_wheel_x(2),u_wheel_x(3),'color',[1 0 0],'maxheadsize',50,'autoscalefactor',100)
quiver3(wheel_avg_position(1),wheel_avg_position(2),wheel_avg_position(3),u_wheel_y(1),u_wheel_y(2),u_wheel_y(3),'color',[1 0 0],'maxheadsize',50,'autoscalefactor',100)
quiver3(wheel_avg_position(1),wheel_avg_position(2),wheel_avg_position(3),normal_vector(1),normal_vector(2),normal_vector(3),'color',[1 0 0],'maxheadsize',50,'autoscalefactor',100)

% robot center xyz axis
quiver3(0,0,0,1,0,0,'color',[1 0 0],'maxheadsize',50,'autoscalefactor',100)
quiver3(0,0,0,0,1,0,'color',[1 0 0],'maxheadsize',50,'autoscalefactor',100)
quiver3(0,0,0,0,0,1,'color',[1 0 0],'maxheadsize',50,'autoscalefactor',100)

S = surf(x,y,z,'FaceAlpha',0.6);
S.EdgeColor = 'none';

xlabel('x')
ylabel('y')
zlabel('z')

axis([-500 500 -500 500 -500 500])