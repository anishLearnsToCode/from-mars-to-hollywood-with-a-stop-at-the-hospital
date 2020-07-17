% Histogram Equilization Custom Implimentation

clc;
clear;
close all;

I = imread('lenna.png');
data = histogram(I, 256);
disp(data);
