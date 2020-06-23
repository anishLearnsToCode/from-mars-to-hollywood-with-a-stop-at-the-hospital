clc;
clear;
close all;

image = imread('lenna.png');
imageGray = rgb2gray(image);
subplot(2, 3, 1); imshow(imageGray);
subplot(2, 3, 2); histogram(double(imageGray(:)), 200);

[imgRed, imgGreen, imgBlue] = channelsFromImage(image);
subplot(2, 3, 3); imshow(image);
subplot(2, 3, 4); imshow(imgRed);
subplot(2, 3, 5); imshow(imgGreen);
subplot(2, 3, 6); imshow(imgBlue);

function [imgRed, imgGreen, imgBlue] = channelsFromImage(image)
    imgRed = image;
    imgRed(:, :, [2, 3]) = 0;
    imgGreen = image;
    imgGreen(:, :, [1, 3]) = 0;
    imgBlue = image;
    imgBlue(:, :, [1, 2]) = 0;
end
