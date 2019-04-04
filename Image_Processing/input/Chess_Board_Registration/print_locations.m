function img_output = print_locations(img_input,option)

alph = 'A';
number = '0';
RGB = img_input;

if option == 1

    for i=0:7
        alph = char(alph + i);
        x_index = 32 + i*130;
        for j=0:7
            y_index = 942 - j*130;
            number = char(number + 1);
            text = strcat(alph, number);
            RGB = insertText(RGB,[x_index, y_index],text,'FontSize',30);
        end
        alph = 'A';
        number = '0';
    end

elseif option == 2
    
    for i=0:7
        alph = char(alph + i);
        x_index = 942 - i*130;
        for j=0:7
            y_index = 32 + j*130; 
            number = char(number + 1);
            text = strcat(alph, number);
            RGB = insertText(RGB,[x_index, y_index],text,'FontSize',30);
        end
        alph = 'A';
        number = '0';
    end

elseif option == 3
    for i=0:7
        alph = char(alph + i);
        y_index = 942 - i*130;
        for j=0:7
            x_index = 942 - j*130;
            number = char(number + 1);
            text = strcat(alph, number);
            RGB = insertText(RGB,[x_index, y_index],text,'FontSize',30);
        end
        alph = 'A';
        number = '0';
    end
    
else    
    for i=0:7
    alph = char(alph + i);
    y_index = 32 + i*130;
        for j=0:7
            x_index = 32 + j*130;
            number = char(number + 1);
            text = strcat(alph, number);
            RGB = insertText(RGB,[x_index, y_index],text,'FontSize',30);
        end
        alph = 'A';
        number = '0';
    end
end

img_output = RGB;