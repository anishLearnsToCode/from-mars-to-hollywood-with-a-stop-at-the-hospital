% Noise Histograms

clc;
clear;
close all;

I = imread('../alien.png');
J1 = imnoise(I, 'gaussian', 0.09);
J2 = imnoise(I, 'gaussian', 0.5);
J3 = imnoise(I, 'salt & pepper', 0.3);

subplot(4, 2, 1); imshow(I);
subplot(4, 2, 2); histogram(I);
subplot(4, 2, 3); imshow(J1);
subplot(4, 2, 4); histogram(J1, 1000);
subplot(4, 2, 5); imshow(J2);
subplot(4, 2, 6); histogram(J2, 1000);
subplot(4, 2, 7); imshow(J3);
subplot(4, 2, 8); histogram(J3, 1000);
