%% example of doing image processing in Python with image from Matlab
% assumes that you have previously installed scipy in Python.
assert(~verLessThan('matlab', '8.4'), 'Matlab >= R2014b required')
%% 200x320 image 
dat = load('clown');
img = dat.X;
%% ravel X to a row vector, and unravel with Numpy
Xp = py.numpy.reshape(img(:)', uint16(size(img)),'F'); 
%% Apply Gaussian filter to image
% Yp = py.skimage.filters.gaussian(Xp, 3);
Yp = py.scipy.ndimage.gaussian_filter(Xp, 3);
%% Y is a regular Matlab 2-D matrix
Y = reshape(cell2mat(cell(Yp.ravel('F').tolist())), size(img)); 
%% plot
figure(1), clf(1)
subplot(1,3,1), imshow(img, dat.map),title('original')
subplot(1,3,2), imshow(Y, dat.map),title('filtered in Python')
%% now let's do something similar in Matlab
% the filter truncation radius isn't the same, so the numerical results differ.
F = fspecial('gaussian',[15,15], 3);
M = imfilter(img, F);

subplot(1,3,3), imshow(M, dat.map), title('Matlab filtered')
