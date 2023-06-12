% Read the color image
image = imread('download3.jpg');

% Convert the image to grayscale
grayImage = im2gray(image);

% Convert the grayscale image to a matrix
matrix = double(grayImage);

[row,col]=find(matrix==0);


% Generate x, y, and z data for surface fitting
[x, y] = meshgrid(1:size(matrix, 2), 1:size(matrix, 1));
xData = x(:);
yData = y(:);
zData = matrix(:);

% Convert all 0's to 0 and any value greater than 1 to 1
matrix(matrix == 0) = 0;
matrix(matrix > 1) = 1;

% Display the modified matrix
disp(matrix);

% Define the fitting function for a surface
fitType = fittype('poly22');

% Perform surface fitting
fitResult = fit([xData, yData], zData, fitType);

plot(row,col)

% Display the fit result
disp(fitResult);
