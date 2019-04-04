function [output location] = find_location(I, bw, option)


gray = rgb2gray(I);

bw_for_pawn = im2bw(gray, 0.8);

%imshow(bw_for_pawn);
filename = strcat(option, '_template.jpg');

template = imread(filename);
bw_template = im2bw(template, 0.5);
im = imerode(bw, bw_template);

index = 1;

RGB = I;

for i=0:7
    w = 65 + i*130;
    for j=0:7
        h = 65 + j*130;
        if im(w,h) == 1
            if strcmp(option, 'white_pawn')
                
                if bw_for_pawn(w,h) == 1
                    
                    location(index,:) = [i+1 j+1];
                    index = index + 1;
                end
            elseif strcmp(option, 'black_pawn')
                if bw_for_pawn(w,h) == 0
                    location(index,:) = [i+1 j+1];
                    index = index + 1;
                end
            else
                 location(index,:) = [i+1 j+1];   
                 index = index + 1;
                 RGB = insertShape(RGB,'circle',[h,w 30], 'LineWidth', 5);
            end

        end
    end

end

output = RGB;

end

