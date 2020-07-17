clc;
clear;
close all;

I = imread('lenna.png');
J = imnoise(I,'salt & pepper',0.02);
K = medfilt3(J, [3 3 3]);
diff = K - I;

subplot(2, 2, 1); imshow(I);
subplot(2, 2, 2); imshow(J);
subplot(2, 2, 3); imshow(K);
subplot(2, 2, 4); imshow(diff);

disp(root_mean_square_error(I, K));
