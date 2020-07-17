% Histogram Equalization;

clc;
clear;
close all;

I = imread('lenna.png');
I2 = histeq(I);
subplot(2, 2, 1); imshow(I);
subplot(2, 2, 2); imhist(I);
subplot(2, 2, 3); imshow(I2);
subplot(2, 2, 4); imhist(I2);
disp(rootMeanSquaredError(I, I2));

function J = rootMeanSquaredError(I, I2)
    [m, n, ~] = size(I);
    I = double(seperateOutChannels(I));
    I2 = double(seperateOutChannels(I2));
    J = (1 / (m * n)) * sum(sum((I - I2) .^ 2));
    J = sqrt(J);
end

function I = seperateOutChannels(image)
    [m, n, channels] = size(image);
    I = uint8(zeros(m, n * channels));
    for channel = 1:channels
        I(:, n * (channel - 1) + 1 : n * channel) = image(:, :, channel);
    end
end