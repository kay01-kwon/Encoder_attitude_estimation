function R_y = rotation_y(pitch)

R_y = [cos(pitch) 0 -sin(pitch);
       0 1 0;
       sin(pitch) 0 cos(pitch)];
end

