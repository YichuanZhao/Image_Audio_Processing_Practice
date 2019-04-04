function bw = is_occupied(img_input)


gray = rgb2gray(img_input);
gray = medfilt2(gray);
thresholds = multithresh(gray, 3);

t1 = thresholds(1);
t2 = thresholds(2);

indices = find(gray > t1 & gray < t2);

gray(indices) = 0;
bw = im2bw(gray, 0.1);


end

