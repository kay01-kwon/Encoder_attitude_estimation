close all;
clear all;

Dx = 140;
Dy = 310.825;

joint_angle_init = [306.2234;80.5273;258.8940;107.3574];

l_x = 191;
l_z = 10;

joint1_pos = [Dx/2;Dy/2;0];
joint2_pos = [Dx/2;-Dy/2;0];
joint3_pos = [-Dx/2;-Dy/2;0];
joint4_pos = [-Dx/2;Dy/2;0];

% Initial position of two points at each link
point11_pos = [-l_z;0;0];
point21_pos = [-l_z;0;0];
point31_pos = [l_z;0;0];
point41_pos = [l_z;0;0];

point12_pos = [-l_z;0;-l_x];
point22_pos = [-l_z;0;-l_x];
point32_pos = [l_z;0;-l_x];
point42_pos = [l_z;0;-l_x];

joint_angle = zeros(4,1);
joint_angle(1) = (253.93-joint_angle_init(1))*pi/180;
joint_angle(2) = -(131.8-joint_angle_init(2))*pi/180;
joint_angle(3) = -(207.6-joint_angle_init(3)-0.4)*pi/180;
            
wheel1_position = draw_wheel_link(joint1_pos,point11_pos,point12_pos,joint_angle(1));
wheel2_position = draw_wheel_link(joint2_pos,point21_pos,point22_pos,joint_angle(2));
wheel3_position = draw_wheel_link(joint3_pos,point31_pos,point32_pos,joint_angle(3));

joint_angle(4) = JointCalculation(wheel1_position,wheel2_position,wheel3_position,l_x,l_z);

wheel4_position = draw_wheel_link(joint4_pos,point41_pos,point42_pos,joint_angle(4));

draw_body_link(joint1_pos,joint2_pos,joint3_pos,joint4_pos)

rotate3d on;
grid on;

normal_vector = data_processing(wheel1_position, wheel2_position, wheel3_position, wheel4_position);
wheel_avg_position = wheel_pos_avg(wheel1_position, wheel2_position, wheel3_position, wheel4_position);


%%
z_base_footprint = BaseFootprintCalculation(normal_vector,wheel_avg_position);

position_base_footprint_wrt_ref2 = [0;0;-z_base_footprint];

[roll,pitch] = RollPitchCalculation(normal_vector);

draw_plane(normal_vector,[0;0;z_base_footprint],roll,pitch);

position_platform_center_wrt_ref3 = CenterCalculation([0;0;z_base_footprint],roll,pitch)

position_base_link_wrt_ref3 = CenterCalculation([0;0;z_base_footprint-530],roll,pitch)


joint_angle_est = joint_angle(4)*180/pi
joint_angle_real_4 = 160.0-joint_angle_init(4)

roll = roll * 180/pi
pitch = pitch * 180/pi