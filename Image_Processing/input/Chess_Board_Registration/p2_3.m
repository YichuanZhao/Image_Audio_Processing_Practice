clear all; clc; close all;
I = imread('p2_board_3.jpg');

[I_use, bw_use, ll, rr, tt, bb] = get_img(I, 50, 150);

rock_on_black = imread('template_black_rock.jpg');
bw_rock_on_black = im2bw(rock_on_black,0.5);
r = imrotate(bw_rock_on_black,-90);

location = get_rock_on_black_location(I_use, r);

option = print_option(location);

temp = print_locations(I_use, option);

I(ll:rr, tt:bb,:) = temp;
imshow(I);
%imwrite(I, 'p2_1.jpg');