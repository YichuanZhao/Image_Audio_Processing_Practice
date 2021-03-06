function moves = knight_moves(current_position, is_occ)

x = current_position(1);
y = current_position(2);

moves = [x+2 y+1; x+2 y-1; x-2 y+1; x-2 y-1; x+1 y+2; x+1 y-2; x-1 y+2; x-1 y-2]

index = 1;

for i = 1:8 
    if moves(index,1) > 8 || moves(index,1) < 1 || moves(index,2) > 8 || moves(index,2) < 1
        moves(index,:) = [];
    else
        index = index + 1;
    end
end

move_size = size(moves, 1)

index = 1;

for j = 1:move_size
    if is_occ(moves(index,1), moves(index,2)) == 1
        moves(index,:) = [];
    else
        index = index + 1;
    end
end

moves(index,:) = current_position;
