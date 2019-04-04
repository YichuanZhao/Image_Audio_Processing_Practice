clear; close all; clc;
I = imread('p1_board.jpg');

[I_use bw_use ll rr tt bb] = get_img(I, 150, 280);

one = ones(120,120);

white = imerode(bw_use, one);
imshow(white);


for i=0:7
    h = 65 + i*130;
    for j=0:7
        w = 65 + j*130;
        x_index = i*130 + 1;
        y_index = j*130 + 1;
        
        if white(h, w) == 1
            I_use(x_index:(x_index+129), y_index:(y_index+129),1) = 0;
        else
            I_use(x_index:(x_index+129), y_index:(y_index+129),2) = 0;
        end
    end
end
      
imshow(I_use);

I(ll:rr, tt:bb,:) = I_use;
imshow(I);

%imwrite(I, 'p1_output.jpg');




