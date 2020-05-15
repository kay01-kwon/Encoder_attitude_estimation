function z_base_footprint = BaseFootprintCalculation( normal_vector, wheel_avg_position)

d = normal_vector'*wheel_avg_position;
z_base_footprint = d/normal_vector(3);

end

