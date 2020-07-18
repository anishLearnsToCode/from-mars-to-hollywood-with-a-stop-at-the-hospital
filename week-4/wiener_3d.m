clc;
clear;
close all;

I = imread('../lenna.png');
J = imnoise(I, 'gaussian', 0, 0.005);
K = wiener3(J, [5 5]);
diff_1 = K - I;

H = fspecial('disk', 10);
blurred = imfilter(J, H, 'replicate');
diff_2 = blurred - I;

subplot(2, 4, 1); imshow(I);
subplot(2, 4, 2); imshow(J);
subplot(2, 4, 3); imshow(K);
subplot(2, 4, 4); imshow(diff_1);

subplot(2, 4, 5); imshow(I);
subplot(2, 4, 5); imshow(J);
subplot(2, 4, 7); imshow(blurred);
subplot(2, 4, 8); imshow(diff_2);

function J = wiener3(I, window)
    [r, g, b] = channels(I);
    r = wiener2(r, window);
    g = wiener2(g, window);
    b = wiener2(b, window);
    J = compose_rgb(r, g, b);
end

function err = rms_error(I1, I2)
    err = sum(sum(I1 - I2) .^ 2);
end

function I = compose_rgb(r, g, b)
    [m, n] = size(r);
    I = uint8(zeros(m, n, 3));
    I(:, :, 1) = r;
    I(:, :, 2) = g;
    I(:, :, 3) = b;
end

function [r, g, b] = channels(I)
    r = I(:, :, 1);
    g = I(:, :, 2);
    b = I(:, :, 3);
end
