clc;
clear;
close all;

% Logarithmic Transformation Operation

I = imread('lenna.png');
I2 = logarithmicTransform(I, 40);
subplot(1, 2, 1); imshow(I);
subplot(1, 2, 2); imshow(I2);

function I = logarithmicTransform(image, factor)
    [red, green, blue] = channelsFrom(image);
    [~, n] = size(red);
    combined = logPointTransform([red green blue], factor);
    red = combined(:, 1 : n);
    green = combined(:, n + 1 : 2 * n);
    blue = combined(:, 2 * n + 1 : 3 * n);
    I = combine(red, green, blue);
end

function I = combine(red, green, blue)
    [m, n] = size(red);
    I = uint8(zeros(m, n, 3));
    I(:, :, 1) = red;
    I(:, :, 2) = green;
    I(:, :, 3) = blue;
end

function [red, green, blue] = channelsFrom(image)
    red = image(:, :, 1);
    green = image(:, :, 2);
    blue = image(:, :, 3);
end

function I = logPointTransform(image, factor)
    I = factor * uint8(log(double(image) + 1));
end
