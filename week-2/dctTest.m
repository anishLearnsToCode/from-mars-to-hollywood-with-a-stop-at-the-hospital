clc;
clear;
close all;

Io = imread('cameraman.tif');
I = im2double(Io);

T = dctmtx(8);
dct = @(block_struct) T * block_struct.data * T';
B = blockproc(I,[8 8],dct);
Bq = quantizeImage(B, 1);

mask = [1   1   1   1   1   0   0   0
        1   1   1   1   0   0   0   0
        1   1   1   0   0   0   0   0
        1   1   0   0   0   0   0   0
        1   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0
        0   0   0   0   0   0   0   0];
    optimumMask = ones(8, 8);
B2 = blockproc(Bq, [8 8],@(block_struct) optimumMask .* block_struct.data);

invdct = @(block_struct) T' * block_struct.data * T;
I2 = blockproc(B2,[8 8],invdct);

subplot(2, 3, 1); imshow(Io);
subplot(2, 3, 2); imshow(I);
subplot(2, 3, 3); imshow(B); 
subplot(2, 3, 4); imshow(Bq);
subplot(2, 3, 5); imshow(I2);
subplot(2, 3, 6); imshow(abs(I - I2));
disp(rootMeanSquaredError(I, I2));


function img = quantizeImage(image, factor)
    img = round(image./ factor, 2) .* factor;
end

function J = rootMeanSquaredError(I, I2)
    [m, n] = size(I);
    J = (1 / (m * n)) * sum(sum((I - I2) .^ 2));
end
