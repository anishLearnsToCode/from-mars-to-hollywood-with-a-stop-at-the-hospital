% Otsu's methiod
% Creaing a threshold in a bi-variate image model that minimizes the 
% weighted class variance

clc;
clear;
close all;

I = imread('coins.png');
level = graythresh(I);
BW = imbinarize(I, level);

subplot(2, 2, 1); imshow(I);
subplot(2, 2, 2); histogram(I, 1000);
subplot(2, 2, 3); imshow(BW);
subplot(2, 2, 4); histogram(BW, 100);
