%!test
%! in_img = imread("../../tests/in/sample1.png");
%! angle = dlmread("../../tests/in/angle1.txt");
%! rotated_img = proximal_rotate(in_img, angle);
%! rotated_img_ref = dlmread("../../tests/ref/proximal/rotated1.txt");
%! assert(max(max(abs(int32(rotated_img) - rotated_img_ref))) <= 5);

%!test
%! in_img = imread("../../tests/in/sample2.png");
%! angle = dlmread("../../tests/in/angle2.txt");
%! rotated_img = proximal_rotate(in_img, angle);
%! rotated_img_ref = dlmread("../../tests/ref/proximal/rotated2.txt");
%! assert(max(max(abs(int32(rotated_img) - rotated_img_ref))) <= 5);

%!test
%! in_img = imread("../../tests/in/sample2.png");
%! angle = dlmread("../../tests/in/angle3.txt");
%! rotated_img = proximal_rotate(in_img, angle);
%! rotated_img_ref = dlmread("../../tests/ref/proximal/rotated3.txt");
%! assert(max(max(abs(int32(rotated_img) - rotated_img_ref))) <= 5);

%!test
%! in_img = imread("../../tests/in/sample3.png");
%! angle = dlmread("../../tests/in/angle4.txt");
%! rotated_img = proximal_rotate(in_img, angle);
%! rotated_img_ref = dlmread("../../tests/ref/proximal/rotated4.txt");
%! assert(max(max(abs(int32(rotated_img) - rotated_img_ref))) <= 5);

%!test
%! in_img = imread("../../tests/in/sample3.png");
%! angle = dlmread("../../tests/in/angle5.txt");
%! rotated_img = proximal_rotate(in_img, angle);
%! rotated_img_ref = dlmread("../../tests/ref/proximal/rotated5.txt");
%! assert(max(max(abs(int32(rotated_img) - rotated_img_ref))) <= 5);
