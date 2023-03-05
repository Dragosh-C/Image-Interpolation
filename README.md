#Proximal
    
I go through each point in the image and find the closest point
of the 4 corners. Then I add the pixel to the final image.

For a color image I extract the three RGB channels and for
I each apply the proximal function from before. At the end I concatenate
I 3 channels in the final matrix.

To change the size of the image, first, I calculate the scaling factors,
I define the transformation matrix and calculate the inverse. After I go through each one
pixel and I calculate the space of the initial image. I find the closest pixel and
I calculate its value in the final matrix.

To rotate the image, I calculate the cosine and sin of the rotation angle, I calculate the matrix
transformation. I calculate the inverse and then determine x_p and y_p from the image space
initials. If the point is outside the image, I add a black pixel and pass
Further. Then I find the 4 points that surround x_p and y_p, I calculate the coefficients
of interpolation and then I calculate the interpolated value of the pizel.


#Bicubic

First I calculate the partial derivatives according to the formula, and then I calculate the three matrices
Ix, Iy, Ixy. For each individual I find the derivatives at all points.

To calculate the interpolation coefficients I calculated the 3 matrices and then I have
found the final matrix by applying the formula.

To change the size of the image, I first calculated the scaling factors, I have
defined the transformation matrix, I found its inverse. Then I calculated the matrices
Ix, Iy, Ixy using the precalculation algorithm. Then I went through each pixel and
I calculated the point (x_p, y_p), then I found the surrounding points and calculated
interpolation coefficients. And then I calculated the interpolated value using
formula

#Lanczos

## Adaptive Lanczos

First I determined the Q and R matrices using the Gram_Schmidt algorithm, and then I
transformed the given pseudocode into octaves.
I did the same for the other two.
