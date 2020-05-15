function R_x = rotation_x(roll)

R_x = [1 0 0;
       0 cos(roll) -sin(roll);
       0 sin(roll) cos(roll)];
end

