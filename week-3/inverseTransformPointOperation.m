% Inverse Point operation 

clc;
clear;
close all;

I = imread('lenna.png');
I2 = inverseImage(I);
I3 = inverseImage(I2);
subplot(1, 3, 1); imshow(I);
subplot(1, 3, 2); imshow(I2);
subplot(1, 3, 3); imshow(I3);

function I = inverseImage(I)
    [red, green, blue] = rgbChannels(I);
    [~, n] = size(red);
    combined = inverseTransform([red, green, blue]);
    red = combined(:, 1 : n);
    green = combined(:, n + 1 : 2 * n);
    blue = combined(:, 2 * n + 1 : 3 * n);
    I = combine(red, green, blue);
end

function I = inverseTransform(image)
    I = 255 - image;
end

function [red, green, blue] = rgbChannels(image)
    red = image(:, :, 1);
    green = image(:, :, 2);
    blue = image(:, :, 3);
end

function I = combine(red, green, blue)
    [m, n] = size(red);
    I = uint8(zeros(m, n, 3));
    I(:, :, 1) = red;
    I(:, :, 2) = green;
    I(:, :, 3) = blue;
end