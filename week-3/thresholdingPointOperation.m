clc;
clear;
close all;

% Thresholding point operation

I = imread('lenna.png');
I2 = thresholdPointOperation(I, 0);
I3 = thresholdPointOperation(I, 25);
I4 = thresholdPointOperation(I, 50);
I5 = thresholdPointOperation(I, 75);
I6 = thresholdPointOperation(I, 100);
I7 = thresholdPointOperation(I, 125);
subplot(3, 3, 1); imshow(I);
subplot(3, 3, 2); imshow(I2);
subplot(3, 3, 3); imshow(I3);
subplot(3, 3, 4); imshow(I4);
subplot(3, 3, 5); imshow(I5);
subplot(3, 3, 6); imshow(I6);
subplot(3, 3, 7); imshow(I7);

function I = thresholdPointOperation(image, threshold)
    [imgRed, imgGreen, imgBlue] = rgbChannels(image);
    imgRed = thresholdOperationChannel(imgRed, threshold);
    imgGreen = thresholdOperationChannel(imgGreen, threshold);
    imgBlue = thresholdOperationChannel(imgBlue, threshold);
    I = combineChannels(imgRed, imgGreen, imgBlue);
end

function img = combineChannels(red, green, blue)
    [m, n] = size(red);
    img = uint8(zeros(m, n, 3));
    img(:, :, 1) = red;
    img(:, :, 2) = green;
    img(:, :, 3) = blue;
end

function img = thresholdOperationChannel(channel, threshold)
    img = channel >= threshold;
    img = img .* 255;
end

function [imgRed, imgGreen, imgBlue] = rgbChannels(image)
    imgRed = image(:, :, 1);
    imgGreen = image(:, :, 2);
    imgBlue = image(:, :, 3);
end
