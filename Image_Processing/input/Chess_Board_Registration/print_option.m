function option = print_option(location)

s = size(location, 1);
option = 1;
if s == 1
    if sum(location) == 1
        option = 4;
    elseif sum(location) == 16
        option = 3;
    else
        if location(1,1) == 8
            option = 1;
        else
            option = 2;
        end
    end
else
    if location(1,1) == 1 && location(1,2) == 1
        if location(2,1) == 8 && location(2,2) == 1
            option = 4;
        else
            option = 2;
        end
    elseif location(1,1) == 1 && location(1,2) == 8
        
        if location(2,1) == 8 && location(2,2) == 8
            option = 3;
        else
            option = 2;
        end
        
    elseif location(1,1) == 8 && location(1,2) == 1
        
        if location(2,1) == 1 && location(2,2) == 1
            option = 4;
        else
            option = 1;
        end
    else
        if location(2,1) == 8 && location(2,2) == 1
            option = 1;
        else
            option = 3;
        end
    end
end