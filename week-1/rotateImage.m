clc;
clear;
close all;

% Rotate image by given angle
image = imread('lenna-220px.png');
imshow(image);
angle = 90;
image = imrotate(image, angle);
imshow(image);
