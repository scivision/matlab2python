%% example of doing image processing in Python with image from Matlab
% assumes that you have previously installed scipy in Python.
assert(~verLessThan('matlab', '9.5'), 'Matlab >= R2018b required')
%% 200x320 image 
dat = load('clown');
img = dat.X;
%% Apply Gaussian filter to image
% Yp = py.skimage.filters.gaussian(Xp, 3);  % segfaults R2018b with Python 3.6
Y = py.scipy.ndimage.gaussian_filter(img, 3);
%% convert from Numpy array to Matlab array
Y = double(Y); 
%% plot
figure(1), clf(1)
subplot(1,3,1), imshow(img, dat.map),title('original')
subplot(1,3,2), imshow(Y, dat.map),title('filtered in Python')
%% now let's do something similar in Matlab
% the filter truncation radius isn't the same, so the numerical results differ.
F = fspecial('gaussian', [15,15], 3);
M = imfilter(img, F);

subplot(1,3,3), imshow(M, dat.map), title('Matlab filtered')
