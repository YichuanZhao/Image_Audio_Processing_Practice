function output_img = draw_steps(input_img, locations)

RGB = input_img;
r_moves = 65 + (locations-1).*130;

for i=1:size(r_moves,1)
    h = r_moves(i,1)
    w = r_moves(i,2);
    RGB = insertShape(RGB,'circle',[r_moves(i,2),r_moves(i,1) 30], 'LineWidth', 5);
end

output_img = RGB;
end

