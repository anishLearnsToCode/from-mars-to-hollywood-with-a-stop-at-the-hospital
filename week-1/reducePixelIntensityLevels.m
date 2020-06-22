clc;
clear;
close all;

image = imread('lenna-220px.png');
image = rgb2gray(image);
image = reduceToLevels(image, 2);
imshow(image);

function img = reduceToLevels(img, levels)
    maxLevels = max(max(img));
    quantized = ceil(maxLevels / (levels - 1));
    img = quantized * round(img ./ quantized);
end
