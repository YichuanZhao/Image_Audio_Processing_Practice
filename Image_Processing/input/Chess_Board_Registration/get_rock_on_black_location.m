function location = get_rock_on_black_location(img_input, template)

I_temp = rgb2gray(img_input);

thresholds = multithresh(I_temp, 3);

t1 = thresholds(2);
t2 = thresholds(3);

indices = find(I_temp > t1 & I_temp < t2);

I_temp(indices) = 0;
bw = im2bw(I_temp, 0.1);

SE = strel('rectangle',[3,3]);
%bw_e = imerode(bw_test, SE);
bw_d = imdilate(bw,SE);

im = imerode(bw_d, template);
%figure; imshow(im);

index  = 1;
if im(65,65) == 1
    location(index, :) = [1, 1];
    index = index + 1;
end

if im(975,65) == 1
    location(index, :) = [8, 1];
    index = index + 1;
end

if im(65,975) == 1
    location(index, :) = [1, 8];
    index = index + 1;
end

if im(975,975) == 1
    location(index, :) = [8, 8];
    index = index + 1;
end

end

