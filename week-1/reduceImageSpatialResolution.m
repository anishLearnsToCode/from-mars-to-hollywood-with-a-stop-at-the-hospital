clc;
clear;
close all;

% Averge of nxn picxel grids in the image
image = imread('lenna-220px.png');
subplot(1, 2, 1); imshow(image);
newImg = spatialReductionAverage(image, 31);
subplot(1, 2, 2); imshow(newImg);

function img = spatialReductionAverage(image, pixels)
    [m, n, channels] = size(image);
    maskSize = (pixels - 1) / 2;
    deduction = 2 * maskSize;
    img = uint8(ones(m - deduction, n - deduction, channels));
    for row = 1 + maskSize : m - maskSize
       for column = 1 + maskSize : n - maskSize
           img(row - maskSize, column - maskSize, :) = uint8(mean(mean(image(row - maskSize : row + maskSize, column - maskSize : column + maskSize, :))));
       end
    end
end