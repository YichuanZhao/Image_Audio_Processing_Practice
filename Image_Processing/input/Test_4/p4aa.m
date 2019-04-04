I = imread('p4_board_1.jpg');

[I_use, bw_use, ll, rr, tt, bb] = get_img(I, 150, 280);

one = ones(125,125);

%imshow(bw_use);


c_bw_use = imcomplement(bw_use);

im = imerode(bw_use, one);
c_im = imerode(c_bw_use, one);

imshow(bw_use);
figure; imshow(c_bw_use);

is_occupied = zeros(8,8);

for i = 0:7
    w = 65 + 130*i;
    for j=0:7
        h = 65 + 130*j;
        if im(w,h) == 1
            is_occupied(i+1, j+1) = 1;
        end
    end
end


for i = 0:7
    w = 65 + 130*i;
    for j=0:7
        h = 65 + 130*j;
        if c_im(w,h) == 1
            is_occupied(i+1, j+1) = 1;
        end
    end
end

is_occupied = imcomplement(is_occupied);






