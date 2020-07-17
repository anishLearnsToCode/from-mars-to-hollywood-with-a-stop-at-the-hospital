% Intensity range Transformations

clc;
clear;
close all;

I = imread('lenna.png');
I2 = intensityTransform(I, [0, 100], 200, 30);
I3 = intensityHighPassFiltering(I, [0, 50], 20);
disp(rootMeanSquaredError(I, I2));
disp(rootMeanSquaredError(I, I3));
subplot(2, 4, 1); imshow(I);
subplot(2, 4, 2); imhist(I);
subplot(2, 4, 3); imshow(I2);
subplot(2, 4, 4); imhist(I2);

subplot(2, 4, 5); imshow(I);
subplot(2, 4, 6); imhist(I);
subplot(2, 4, 7); imshow(I3);
subplot(2, 4, 8); imhist(I3);

function I = intensityHighPassFiltering(image, r, highPassVal)
    [~, ~, channels] = size(image);
    combined = seperateOutChannels(image);
    start = r(1); rangeEnd = r(2);
    highFilterMask = highPassVal * (((combined >= start) + (combined <= rangeEnd)) == 2);
    lowFilterMask = double(combined) .* double((((combined < start) + (combined > rangeEnd)) >= 1));
    combined = highFilterMask + lowFilterMask;
    I = combine(combined, channels);
end

function I = intensityTransform(image, r, highPassVal, lowPassVal)
    [~, ~, channels] = size(image);
    combined = seperateOutChannels(image);
    start = r(1); rangeEnd = r(2);
    highFilterMask = highPassVal * (((combined >= start) + (combined <= rangeEnd)) == 2);
    lowFilterMask = lowPassVal * (((combined < start) + (combined > rangeEnd)) >= 1);
    combined = highFilterMask + lowFilterMask;
    I = combine(combined, channels);
end

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

function I = combine(image, channels)
    [m, n] = size(image);
    n = n / channels;
    I = uint8(zeros(m, n, channels));
    for channel = 1 : channels
        I(:, :, channel) = image(:, n * (channel - 1) + 1 : n * channel);
    end
end
