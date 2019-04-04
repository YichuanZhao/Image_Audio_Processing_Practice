function [output location] = find_and_draw_location(I, bw, option)

filename_white = strcat('white_',option,'_template.jpg');
filename_black = strcat('black_',option,'_template.jpg');

black_knight = imread(filename_black);
bw_black_knight = im2bw(black_knight, 0.5);
im_b = imerode(bw, bw_black_knight);

white_knight = imread(filename_white);
bw_white_knight = im2bw(white_knight, 0.5);
im_w = imerode(bw, bw_white_knight);

index = 1;

RGB = I;
for i=0:7
    w = 65 + i*130;
    for j=0:7
        h = 65 + j*130;
        if im_b(w,h) == 1 || im_w(w,h) == 1
            location(index,:) = [i+1 j+1];
            index = index+1;
            if strcmp(option, 'knight')
                RGB = insertShape(RGB,'circle',[h,w 30], 'LineWidth', 5);
                RGB = insertText(RGB,[h-40, w-20],'Knight','FontSize',20);
            elseif strcmp(option, 'bishop')
                RGB = insertShape(RGB,'circle',[h,w 30], 'LineWidth', 5, 'Color', 'red');
                RGB = insertText(RGB,[h-40, w-20],'Bishop','FontSize',20);
            elseif strcmp(option, 'rock')
                RGB = insertShape(RGB,'circle',[h,w 30], 'LineWidth', 5, 'Color', 'blue');
                RGB = insertText(RGB,[h-40, w-20],'Rock','FontSize',20);
            elseif strcmp(option, 'queen')
                RGB = insertShape(RGB,'circle',[h,w 30], 'LineWidth', 5, 'Color', 'green');
                RGB = insertText(RGB,[h-40, w-20],'Queen','FontSize',20);
            else
                RGB = insertShape(RGB,'circle',[h,w 30], 'LineWidth', 5, 'Color', 'cyan');
                RGB = insertText(RGB,[h-40, w-20],'King','FontSize',20);
            end

        end
    end

end

output = RGB;


