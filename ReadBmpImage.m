%%
% The ReadBmpImage read the bmp image
%
% The parameters received are:
% - image_filename: image filename
%
% The function returns:
% - X (n x 3): Matrix for a color image RGB, where n is the number of
% pixels. 
% - w (1 x 1): width of the image, in pixels
% - h (1 x 1): height of the image, in pixels
%
function [X,w,h] = ReadBmpImage(image_filename)
    [img, cmap] = imread(image_filename);
    img_rgb = ind2rgb(img,cmap);
    img_double = im2double(img_rgb);
    [w,h,d] = size(img_double);
    X = reshape(img_double,w*h,d);
end

