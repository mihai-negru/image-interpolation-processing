function [] = checker_bicubic()
    [bicubic_diff, bicubic_diff_max] = test("checker/checker_bicubic_diff");
    printf("Bicubic derivate: %d / %d passed tests.\n", bicubic_diff, bicubic_diff_max);
    
    [bicubic_coef, bicubic_coef_max] = test("checker/checker_bicubic_coef");
    printf("Bicubic coefficients: %d / %d passed tests.\n", bicubic_coef, bicubic_coef_max);
    
    [bicubic_resize, bicubic_resize_max] = test("checker/checker_bicubic_resize");
    printf("Resize image: %d / %d passed tests.\n", bicubic_resize, bicubic_resize_max);
    
    [bicubic_resize_RGB, bicubic_resize_RGB_max] = test("checker/checker_bicubic_resize_RGB");
    printf("Resize RGB image: %d / %d passed tests.\n", bicubic_resize_RGB, bicubic_resize_RGB_max);
endfunction
