clc;
clear;
close all;

I = imread('../lenna.png');
I = rgb2gray(I);
J1 = imnoise(I, 'gaussian', 0.02);
J2 = imnoise(I, 'salt & pepper', 0.02);
J3 = imnoise(I, 'salt & pepper', 0.2);

subplot(2, 3, 1); imshow(I);
subplot(2, 3, 2); imshow(J1);
subplot(2, 3, 3); imshow(J2);
subplot(2, 3, 4); imshow(J3);
