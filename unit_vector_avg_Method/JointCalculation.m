function joint_angle4 = JointCalculation(wheel1_position,wheel2_position,wheel3_position,l_x,l_z)

data = [wheel1_position wheel2_position wheel3_position];

u = data(:,1) - data(:,2);
v = data(:,3) - data(:,2);

N = cross(u,v);

d = -N'*[wheel1_position(1);0;wheel1_position(3)];
a1 = -N(1)*l_z + N(3)*l_x + d;
a2 = -2*(N(1)*l_x + N(3)*l_z);
a3 = N(1)*l_z - N(3)*l_x + d;

t = (-a2 + sqrt(a2^2-4*a1*a3))/2/a1;

joint_angle4 = atan(t)*2;

end

