% Spatial avaergae of pixels in neighbourhood

clc;
clear;

img = imread('lenna-220px.png');
subplot(1, 2, 1); imshow(img);
newImg = spatialAvg(img, 7);
subplot(1, 2, 2); imshow(newImg);

function [img, average] = spatialAvg(image, pixels)
   [m, n, ~] = size(image);
   img = image;
   maskSize = (pixels - 1) / 2;
   if maskSize == 0
       return;
   end
   
   % Bulk matrix
   for row = maskSize + 1: (m - maskSize)
       for column = 1 + maskSize : (n - maskSize)
           spatialImg = image(row - maskSize : row + maskSize, column - maskSize : column + maskSize, :);
           average = mean(mean(spatialImg));
           img(row, column, :) = average;
       end
   end
   
   % first row
   for column = 1 + maskSize : n - maskSize
       img(1, column, :) = mean(mean(img(1:1 + maskSize, column : column + maskSize, :)));
   end
   
   % last row
   for column = 1 + maskSize : n - maskSize
       img(m, column, :) = mean(mean(image(m - maskSize:m, column : column + maskSize, :)));
   end
   
   % first column
   for row = 1 + maskSize : m - maskSize
       img(row, 1, :) = mean(mean(image(row - maskSize : row + maskSize, 1 : 1 + maskSize, :)));
   end
   
   % last column
   for row = 1 + maskSize : m - maskSize
       img(row, column, :) = mean(mean(image(row - maskSize : row + maskSize, n - maskSize : n, :)));
   end
end
