function [roll,pitch] = RollPitchCalculation(normal_vector)

pitch = -asin(normal_vector(1));
roll = -atan2(normal_vector(2)/cos(pitch),normal_vector(3)/cos(pitch));

end

