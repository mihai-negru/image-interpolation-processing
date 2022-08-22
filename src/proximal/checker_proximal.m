function [] = checker_proximal()
    [PROXIMAL_4point, PROXIMAL_4point_max] = test("checker/checker_proximal_4points");
    printf("Interpolate 4 points: %d / %d passed tests.\n", PROXIMAL_4point, PROXIMAL_4point_max);

    [PROXIMAL_4point_RGB, PROXIMAL_4point_RGB_max] = test("checker/checker_proximal_4points_RGB");
    printf("Interpolate 4 points RGB: %d / %d passed tests.\n", PROXIMAL_4point_RGB, PROXIMAL_4point_RGB_max);

    [PROXIMAL_resize, PROXIMAL_resize_max] = test("checker/checker_proximal_resize");
    printf("Resize image: %d / %d passed tests.\n", PROXIMAL_resize, PROXIMAL_resize_max);

    [PROXIMAL_resize_RGB, PROXIMAL_resize_RGB_max] = test("checker/checker_proximal_resize_RGB");
    printf("Resize RGB image: %d / %d passed tests.\n", PROXIMAL_resize_RGB, PROXIMAL_resize_RGB_max);

    [PROXIMAL_rotate, PROXIMAL_rotate_max] = test("checker/checker_proximal_rotate");
    printf("Rotate image: %d / %d passed tests.\n", PROXIMAL_rotate, PROXIMAL_rotate_max);

    [PROXIMAL_rotate_RGB, PROXIMAL_rotate_RGB_max] = test("checker/checker_proximal_rotate_RGB");
    printf("Rotate RGB image: %d / %d passed tests.\n", PROXIMAL_rotate_RGB, PROXIMAL_rotate_RGB_max);
end
