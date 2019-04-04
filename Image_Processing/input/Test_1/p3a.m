clear; close all; clc;
I = imread('p3a_board_3.jpg');

[I_use, bw_use, ll, rr, tt, bb] = get_img(I, 150, 280);

bw = is_occupied(I_use);


im_bw = imcomplement(bw);
SE = strel('rectangle', [3,3]);
%bw_e = imerode(bw,SE);
bw_d = imdilate(im_bw,SE);

[I1 location_knight] = find_and_draw_location(I_use, bw_d, 'knight');

imshow(I1);

I(ll:rr, tt:bb, :) = I1;

%imwrite(I, 'p3a_3.jpg');
