function normal_vector=data_processing(wheel_pos1, wheel_pos2, wheel_pos3, wheel_pos4)

data = [wheel_pos1 wheel_pos2 wheel_pos3 wheel_pos4];

u1 = data(:,3) - data(:,1);
v1 = data(:,2) - data(:,1);

n1 = cross(u1,v1)

u2 = data(:,4) - data(:,2);
v2 = data(:,3) - data(:,2);

n2 = cross(u2,v2)

u3 = data(:,1) - data(:,3);
v3 = data(:,4) - data(:,3);

n3 = cross(u3,v3)

u4 = data(:,2) - data(:,4);
v4 = data(:,1) - data(:,4);

n4 = cross(u4,v4)

n = (n1 + n2 + n3 + n4)/4;                                                                                                                                                           

normal_vector = n / sqrt(n'*n);