function moves = bishop_moves(current_position, is_occupied, can_eat)

x = current_position(1);
y = current_position(2);

index = 1;

x_index = x + 1;
y_index = y + 1;

while x_index <= 8 && x_index >=1 && y_index <= 8 && y_index >=1

    if is_occupied(x_index, y_index) == 1
        break;
    else
        moves(index,:) = [x_index, y_index];
        index = index + 1;
    end
    
    if can_eat(x_index, y_index) == 1
        moves(index,:) = [x_index, y_index];
        break;
    end
    
    x_index = x_index + 1;
    y_index = y_index + 1;

end

x_index = x - 1;
y_index = y - 1;

while x_index <= 8 && x_index >=1 && y_index <= 8 && y_index >=1

    if is_occupied(x_index, y_index) == 1
        break;
    else
        moves(index,:) = [x_index, y_index];
        index = index + 1;
    end
    
    if can_eat(x_index, y_index) == 1
        moves(index,:) = [x_index, y_index];
        break;
    end
    
    x_index = x_index - 1;
    y_index = y_index - 1;
end

x_index = x + 1;
y_index = y - 1;

while x_index <= 8 && x_index >=1 && y_index <= 8 && y_index >=1

    if is_occupied(x_index, y_index) == 1
        break;
    else
        moves(index,:) = [x_index, y_index];
        index = index + 1;
    end
    
    if can_eat(x_index, y_index) == 1
        moves(index,:) = [x_index, y_index];
        break;
    end
    x_index = x_index + 1;
    y_index = y_index - 1;
end


x_index = x - 1;
y_index = y + 1;

while x_index <= 8 && x_index >=1 && y_index <= 8 && y_index >=1

    if is_occupied(x_index, y_index) == 1
        break;
    else
        moves(index,:) = [x_index, y_index];
        index = index + 1;
    end
    
    if can_eat(x_index, y_index) == 1
        moves(index,:) = [x_index, y_index];
        break;
    end
    
    x_index = x_index - 1;
    y_index = y_index + 1;
end

s = size(moves,1);
moves(s+1,:) = current_position;
