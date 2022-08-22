# image-interpolation-processing
A minimalist Matlab implementation of the image basic processign functions like: rotating an image and scaling an image. The project works for both greyscaled images and RBG images. Project tries to solve those problems using 3 different interpolation methods "proximal", "bicubic" and "lanczos"

## Table of Contents

1. [Getting Started](#start-description)
2. [Using Project](#using-description)
3. [Testing](#test-description)

<a name="start-description"></a>
## **Getting Started**

Project "image-interpolation-processing" is a small api to process any type of images and to perfom som ebasic functions like rotating or scaling. The most interesnting think is that if we perform an action on a white-black image we can perform the same action on a RGB image, however we should make an action on every color channel considering every channel as a white-black image.

For this project you have 3 interpolations that will help us to perform those operations:

* Proximal Interpolation
* Bicubic Interpolation
* Lanczos Interpolation

For every type of interpolation exists a folder with all helper and main functions to perform above functions

<a name="using-description"></a>
## **Using Project**

In order to use a function for example the bicubic resize of one image, you should:

* Read the image into the system with  **imread**
* Send the image with other params in the specific function
* After that as an result you will get an image (greyscaled or RGB)
* After receving the image you should write on disk with **imwrite**

Example of executing one function:

```MATLAB
    >> img = imread("path\\to\\file\\image.ext");
    >> img = bicubic_resize_rgb(img, 2000, 4000); % Can pass another new sizes
    >> imwrite(img, "path\\to\\savefile\\new_image.ext");
```

Other functions for different interpolations works the **same**.

<a name="test-description"></a>
## **Testing**

In order to tast some examples how they work and what the project does in a nutshell you first have to check that:

* You do not run the code in MATLAB, but you run it in **OCTAVE**.
* You have to be in the folder of the interpolation that you want to check

For example to test proximal interpolation you should run:

```MATLAB
    >> check_proximal();
```

After that some messages with what tests are passed and what test are not passed (depends of you system)

### Have fun coding
