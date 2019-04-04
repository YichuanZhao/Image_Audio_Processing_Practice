clear; close all; clc;
I = imread('p4_board_2.jpg');

[I_use, bw_use, ll, rr, tt, bb] = get_img(I, 150, 280);

bw = is_occupied(I_use);


im_bw = imcomplement(bw);
SE = strel('rectangle', [3,3]);
%bw_e = imerode(bw,SE);
bw_d = imdilate(im_bw,SE);

%white_pawn = im_bw(261:390, 261:390);
%imwrite(white_pawn, 'white_pawn_template.jpg');

%black_pawn = im_bw(131:260, 261:390);
%imwrite(black_pawn, 'black_pawn_template.jpg');


[I_bp location_black_pawn] = find_location(I_use, bw_d, 'black_pawn');
[I_bk location_black_knight] = find_location(I_use, bw_d, 'black_knight');
[I_bb location_black_bishop] = find_location(I_use, bw_d, 'black_bishop');
[I_br location_black_rock] = find_location(I_use, bw_d, 'black_rock');
[I_bq location_black_queen] = find_location(I_use, bw_d, 'black_queen');
[I_bking location_black_king] = find_location(I_use, bw_d, 'black_king');

[I_wp location_white_pawn] = find_location(I_use, bw_d, 'white_pawn');
[I_wk location_white_knight] = find_location(I_use, bw_d, 'white_knight');
[I_wb location_white_bishop] = find_location(I_use, bw_d, 'white_bishop');
[Iwr location_white_rock] = find_location(I_use, bw_d, 'white_rock');
[I_wq location_white_queen] = find_location(I_use, bw_d, 'white_queen');
[I_wking location_white_king] = find_location(I_use, bw_d, 'white_king');


location_black = [location_black_pawn; location_black_knight; location_black_bishop;... 
    location_black_rock; location_black_queen; location_black_king];

location_white = [location_white_pawn; location_white_knight; location_white_bishop;... 
    location_white_rock; location_white_queen; location_white_king];

is_occ_for_white_stones = zeros(8,8);
for i=1:size(location_black, 1)
    is_occ_for_white_stones(location_white(i,1), location_white(i,2)) = 1;
    
end

is_occ_for_black_stones = zeros(8,8);
for i=1:size(location_black, 1)
    is_occ_for_black_stones(location_black(i,1), location_black(i,2)) = 1;
    
end

%moves = knight_moves(location_white_knight(2,:), is_occ_for_white_stones);
moves = knight_moves(location_black_knight(1,:), is_occ_for_black_stones);
%moves = bishop_moves([3 1], is_occ_for_black_stones, is_occ_for_white_stones);

I_temp = draw_steps(I_use, moves);
% RGB = I_use;
% r_moves = 65 + (moves-1).*130;
% 
% for i=1:size(r_moves,1)
%     h = r_moves(i,1)
%     w = r_moves(i,2);
%     RGB = insertShape(RGB,'circle',[r_moves(i,2),r_moves(i,1) 30], 'LineWidth', 5);
% end
imshow(I_temp);

I(ll:rr, tt:bb, :) = I_temp;
%imwrite(I, 'p4_3.jpg');
