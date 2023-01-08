% List of image filenames
filenames = {'./images/0001.png', './images/0017.png', './images/0020.png', './images/0045.png', './images/0070.png', './images/0078.png'};
% Loop through the filenames and process the images
for i = 1:numel(filenames)
  % Load the image
  ct_image = imread(filenames{i});
  % Create the output filename
  output_filename = sprintf('./output/contour_%04d.png', i);
  % Detect the contours in the image
  output_img = canny_detector(ct_image, output_filename);
end