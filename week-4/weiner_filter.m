% Weiner filter

clc;
clear;
close all;

I = imread('../lenna.png');
I = rgb2gray(I);
J = imnoise(I, 'gaussian', 0, 0.005);
K1 = wiener2(J, [10 10]);
K2 = wiener2(J, [5 5]);
K3 = wiener2(J, [3 3]);
K4 = wiener2(J, [2 2]);

H = fspecial('disk', 10);
blurred = imfilter(J, H, 'replicate');

subplot(2, 4, 1); imshow(I);
subplot(2, 4, 2); imshow(J);
subplot(2, 4, 3); imshow(H);
subplot(2, 4, 4); imshow(blurred);

subplot(2, 4, 5); imshow(K1);
subplot(2, 4, 6); imshow(K2);
subplot(2, 4, 7); imshow(K3);
subplot(2, 4, 8); imshow(K4);
