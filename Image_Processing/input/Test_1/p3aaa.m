clear; close all; clc;
I = imread('p3a_board_2.jpg');

[I_use, bw_use, ll, rr, tt, bb] = get_img(I, 150, 280);

bw = is_occupied(I_use);

im_bw = imcomplement(bw);
SE = strel('rectangle', [3,3]);
%bw_e = imerode(bw,SE);
bw_d = imdilate(im_bw,SE);

black_knight = imread('black_knight_template.jpg');
bw_black_knight = im2bw(black_knight, 0.5);
im_b = imerode(bw_d, bw_black_knight);

white_knight = imread('white_knight_template.jpg');
bw_white_knight = im2bw(white_knight, 0.5);
im_w = imerode(bw_d, bw_white_knight);

[I_r_b location] = find_and_draw_location(I_use, im_b, 1);
[I_r_w location] = find_and_draw_location(I_r_b, im_w, 2);

imshow(I_r_w);
