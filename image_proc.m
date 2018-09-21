function image_proc()
%% example of doing image processing in Python with image from Matlab

% 200x320 image is now in variable X
img = load('clown');

% I ravel X to a row vector, and unravel with Numpy
Xp = py.numpy.reshape(img(:)',size(img),'F'); 

% Apply Gaussian filter to image
Yp = py.skimage.filters.gaussian(Xp,3);

% now let's come back to Matlab
% Y is a regular Matlab 2-D matrix
Y = reshape(cell2mat(cell(Yp.ravel('F').tolist())),size(X)); 

 %map comes from when you load clown
 figure
 subplot(1,2,1), imshow(img, map),title('original')
 subplot(1,2,2), imshow(Y,map),title('filtered by Python Scikit-Image')
%======================================================================
% now let's do something similar in Matlab--
% note I didn't make the filter truncation radius the same, so the numerical results differ.
F = fspecial('gaussian',[15,15],3);
M = imfilter(X,F);
imshow(M,map)

end
