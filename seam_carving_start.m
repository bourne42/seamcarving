close all; % closes all figures

% read images and convert to single format
im1 = im2single(imread('tardis.jpg'));
im2 = im2single(imread('hourglass.jpg'));
%im1 = rgb2gray(im1); % convert to grayscale
%im2 = rgb2gray(im2);

% use this if you want to align the two images (e.g., by the eyes) and crop
% them to be of same size
[im2, im1] = align_images(im2, im1);

%im12 = hybridImage(im1,im2,500,70);

%% Crop resulting image (optional)
% figure(1), hold off, imagesc(im12), axis image, colormap gray
% disp('input crop points');
%  [x, y] = ginput(2);  x = round(x); y = round(y);
%  im12 = im12(min(y):max(y), min(x):max(x), :);
%  figure(1), hold off, imagesc(im12), axis image, colormap gray

%% Compute and display Gaussian and Laplacian Pyramids (you need to supply this function)
% N = 5; % number of pyramid levels (you may use more or fewer, as needed)
% pyramids(im12, N);
