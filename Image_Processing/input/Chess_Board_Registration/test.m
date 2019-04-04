clear all; clc; close all;
I = imread('p2_board_3.jpg');

[I_use, bw_use, ll, rr, tt, bb] = get_img(I, 50, 150);

SE = strel('rectangle',[3,3]);
bw = imerode(bw_use, SE);
bw_d = imdilate(bw,SE);
%imshow(bw_d);


I_temp = rgb2gray(I_use);

t = multithresh(I_temp, 3);


% threshForPlanes = zeros(3,3);			
% 
% for i = 1:3
%     threshForPlanes(i,:) = multithresh(I(:,:,i),3);
% end
% 
% value = [0 threshRGB(2:end) 255]; 
% 
% quantRGB = imquantize(I_temp, threshRGB, value);

indices = find(I_temp > 140 & I_temp<212);

I_temp(indices) = 0;
bw_test = im2bw(I_temp, 0.1);

SE = strel('rectangle',[3,3]);
%bw = imerode(bw_test, SE);
bw_d = imdilate(bw_test,SE);

imshow(bw_d);

%rock_on_black = bw(921:1030, 11:120);
%figure; imshow(rock_on_black);
%imwrite(rock_on_black, 'template_black_rock.jpg');
o_rock_on_black = imread('template_black_rock.jpg');
rock_on_black = im2bw(o_rock_on_black,0.5);
r = imrotate(rock_on_black,-90);

im = imerode(bw_d, r);
figure; imshow(im);



