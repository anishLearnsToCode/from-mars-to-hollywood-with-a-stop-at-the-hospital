clc;
clear;
close all;

I = imread('lenna.png');
power = 1.01;
factor = 1;
I2 = gammaTransform(I, power, factor);

subplot(1, 2, 1); imshow(I);
subplot(1, 2, 2); imshow(I2);
disp(rootMeanSquaredError(I, I2));

function J = rootMeanSquaredError(I, I2)
    [m, n, ~] = size(I);
    I = double(seperateOutChannels(I));
    I2 = double(seperateOutChannels(I2));
    J = (1 / (m * n)) * sum(sum((I - I2) .^ 2));
    J = sqrt(J);
end

function I = gammaTransform(image, power, factor)
    [~, ~, channels] = size(image);
    combined = seperateOutChannels(image);
    transformed = uint8(factor * double(combined) .^ power);
    I = combine(transformed, channels);
end

function I = seperateOutChannels(image)
    [m, n, channels] = size(image);
    I = uint8(zeros(m, n * channels));
    for channel = 1:channels
        I(:, n * (channel - 1) + 1 : n * channel) = image(:, :, channel);
    end
end

function I = combine(image, channels)
    [m, n] = size(image);
    n = n / channels;
    I = uint8(zeros(m, n, channels));
    for channel = 1 : channels
        I(:, :, channel) = image(:, n * (channel - 1) + 1 : n * channel);
    end
end