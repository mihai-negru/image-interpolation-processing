%!test
%! I = imread("../../tests/in/sample1.png");
%! [img_x, img_y, img_xy] = compute_diffs(I);
%! img_x_ref = dlmread("../../tests/ref/bicubic/Ix1.txt");
%! img_y_ref = dlmread("../../tests/ref/bicubic/Iy1.txt");
%! img_xy_ref = dlmread("../../tests/ref/bicubic/Ixy1.txt");
%! assert(max(max(abs(img_x_ref - img_x))) <= 5 && max(max(abs(img_y_ref - img_y))) <= 5 && max(max(abs(img_xy_ref - img_xy))) <= 5);

%!test
%! I = imread("../../tests/in/sample2.png");
%! [img_x, img_y, img_xy] = compute_diffs(I);
%! img_x_ref = dlmread("../../tests/ref/bicubic/Ix2.txt");
%! img_y_ref = dlmread("../../tests/ref/bicubic/Iy2.txt");
%! img_xy_ref = dlmread("../../tests/ref/bicubic/Ixy2.txt");
%! assert(max(max(abs(img_x_ref - img_x))) <= 5 && max(max(abs(img_y_ref - img_y))) <= 5 && max(max(abs(img_xy_ref - img_xy))) <= 5);

%!test
%! I = imread("../../tests/in/sample3.png");
%! [img_x, img_y, img_xy] = compute_diffs(I);
%! img_x_ref = dlmread("../../tests/ref/bicubic/Ix3.txt");
%! img_y_ref = dlmread("../../tests/ref/bicubic/Iy3.txt");
%! img_xy_ref = dlmread("../../tests/ref/bicubic/Ixy3.txt");
%! assert(max(max(abs(img_x_ref - img_x))) <= 5 && max(max(abs(img_y_ref - img_y))) <= 5 && max(max(abs(img_xy_ref - img_xy))) <= 5);
