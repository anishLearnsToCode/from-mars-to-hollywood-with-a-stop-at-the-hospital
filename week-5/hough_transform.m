% Hough Transform
% Detecting most prominent line in an image using canny edge detection
% algorithm

clc;
clear;
close all;

I = imread('circuit.tif');
I_rotated = imrotate(I, 33, 'crop');
BW = edge(I_rotated, 'canny');
[H, T, R] = hough(BW);

subplot(1, 2, 2); imshow(H, [], 'XData', T, 'YData', R, 'InitialMagnification', 'fit');
xlabel('\theta'); ylabel('\rho');
axis on; axis normal; hold on;

P = houghpeaks(H, 5, 'threshold', ceil(0.3 * max(H(:))));
x = T(P(:, 2));
y = R(P(:, 1));
plot(x, y, 's', 'color', 'white');

% Find lines and plot them
lines = houghlines(BW, T, R, P, 'FillGap', 5, 'MinLength', 7);
subplot(1, 2, 1); imshow(I_rotated); hold on;

max_len = 0;
for k = 1 : length(lines)
    xy = [lines(k).point1 ; lines(k).point2];
    plot(xy(:, 1), xy(:, 2), 'LineWidth', 2, 'Color', 'green');
    
    % Plot beginnings and end of lines
    plot(xy(1, 1), xy(1, 2), 'x', 'LineWidth', 2, 'Color', 'yellow');
    plot(xy(2, 1), xy(2, 2), 'x', 'LineWidth', 2, 'Color', 'red');
    
    % Determine end point of longest line segment
    len = norm(lines(k).point1 - lines(k).point2);
    if len > max_len
        max_len = len;
        xy_long = xy;
    end
end
