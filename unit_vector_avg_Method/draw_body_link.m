function draw_body_link(j1,j2,j3,j4)

line([j1(1) j2(1)],[j1(2) j2(2)],[j1(3) j2(3)]);
line([j2(1) j3(1)],[j2(2) j3(2)],[j2(3) j3(3)]);
line([j3(1) j4(1)],[j3(2) j4(2)],[j3(3) j4(3)]);
line([j4(1) j1(1)],[j4(2) j1(2)],[j4(3) j1(3)]);
