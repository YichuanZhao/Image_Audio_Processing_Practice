function y = generate_wave(s_len, f, fs, n)

temp = ones(1,s_len);

k = 1;
for mm=1:200
    
    temp((mm*900 + 1):(mm*900 + 900)) = k;
    if mod(mm,8) == 0
        k = 1;
    else
        k = k - 0.1;
    end
        
end

y = temp.*sin(2*pi*n*f/fs);                % generate the signal

end

