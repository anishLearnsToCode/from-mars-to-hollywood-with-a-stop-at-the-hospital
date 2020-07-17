clc;
clear;
close all;

I = imread('lenna.png');
S = imread('owl.jpg');
J = imhistmatch(I, S);
K = histeq(J);
subplot(1, 3, 1); imshow(I);
subplot(1, 3, 2); imshow(J);
subplot(1, 3, 3); imshow(K);
