function output_img = canny_detector(ct_image, output_filename)
% Detecct contours of human organs in CT images using the Canny edge detector in Matlab
% and return the produced binarized contour image after edge linking. The function
% determines both thresholds of the deteqctor empirically and stores the output image
% into a .png file.
%
%   Input:
%   - ct_image: The CT image to process.
%   - output_filename: The file to store the output image.
%
%   Output:
%   - output_img: The image with the contours.

% Convert the image to grayscale
gray_img = im2gray(ct_image);

% Determine the optimal thresholds for the Canny edge detector using the Otsu method
[~, threshold] = edge(gray_img, 'Canny');
fudgeFactor = 1;
lowerThreshold = threshold(1) * fudgeFactor;
upperThreshold = threshold(2) * fudgeFactor;

% Apply the Canny edge detector to the grayscale image with the determined thresholds
edges = edge(gray_img, 'Canny', [lowerThreshold, upperThreshold]);

% Link the edges in the image
edges = bwmorph(edges, 'bridge');

% Save the output image to a file
imwrite(edges, output_filename);

% Return the output image
output_img = edges;
end