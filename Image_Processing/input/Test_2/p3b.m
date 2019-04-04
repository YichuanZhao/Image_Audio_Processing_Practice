clear; close all; clc;
I = imread('p3b_board_2.jpg');

[I_use, bw_use, ll, rr, tt, bb] = get_img(I, 150, 280);

bw = is_occupied(I_use);


im_bw = imcomplement(bw);
SE = strel('rectangle', [5,5]);
%bw_e = imerode(bw,SE);
bw_d = imdilate(im_bw,SE);

[I1 location_knight] = find_and_draw_location(I_use, bw_d, 'knight');
[I2 location_bishop] = find_and_draw_location(I1, bw_d, 'bishop');
[I3 location_rock] = find_and_draw_location(I2, bw_d, 'rock');
[I4 location_queen] = find_and_draw_location(I3, bw_d, 'queen');
[I5 location_king] = find_and_draw_location(I4, bw_d, 'king');


%[I_r_w location] = find_and_draw_location(I_r_b, im_w, knight);
imshow(I5);

I(ll:rr, tt:bb, :) = I5;

imwrite(I, 'p3b_2.jpg');
