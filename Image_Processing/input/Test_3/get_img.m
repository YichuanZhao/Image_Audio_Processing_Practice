function [output_img bw_output ll rr tt bb] = get_use(input_img, index_1, index_2)


gray = rgb2gray(input_img);

B = medfilt2(gray);

bw = im2bw(B, 0.8);
%RGB = insertShape(I,'circle',[150 280 35], 'LineWidth', 5);

L = bw(:,index_1);
T = bw(index_1, :);
R = bw(:,index_2);
B = bw(index_2,:);

l = find(L == 0);
ll = min(l);

t = find(T == 0);
tt = min(t);

r = find(R == 0);
rr = max(r);

b = find(B == 0);
bb = max(b);

output_img = input_img(ll:rr, tt:bb,:);

bw_output = bw(ll:rr, tt:bb);

end

