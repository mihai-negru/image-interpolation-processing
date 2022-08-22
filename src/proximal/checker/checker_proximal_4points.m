%!test
%! in_img = imread("../../tests/in/points1.png");
%! step = dlmread("../../tests/in/points1_step.txt");
%! out_img = proximal_interpolation_2x2(in_img, step);
%! ref = dlmread("../../tests/ref/proximal/2x2_1.txt");
%! assert(max(max(abs(ref - int32(out_img)))) <= 5);

%!test
%! in_img = imread("../../tests/in/points2.png");
%! step = dlmread("../../tests/in/points2_step.txt");
%! out_img = proximal_interpolation_2x2(in_img, step);
%! ref = dlmread("../../tests/ref/proximal/2x2_2.txt");
%! assert(max(max(abs(ref - int32(out_img)))) <= 5);

%!test
%! in_img = imread("../../tests/in/points3.png");
%! step = dlmread("../../tests/in/points3_step.txt");
%! out_img = proximal_interpolation_2x2(in_img, step);
%! ref = dlmread("../../tests/ref/proximal/2x2_3.txt");
%! assert(max(max(abs(ref - int32(out_img)))) <= 5);
