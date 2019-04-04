function [spec, f, t] = test_stft(Y, win_size, overlap, fft_size, fs)

Ylen = length(Y);

% create a periodic hamming window
han_win = hamming(win_size, 'periodic');

%
row_number = ceil(fft_size/2);            % the number of rows
col_number = 1+floor((Ylen-win_size)/overlap);      % the number of columns
spec = zeros(row_number, col_number);           % initialize the result matrix

%
index = 0;

% STFT
for col = 1:col_number
    % Apply hamming window
    temp_Y = Y(index+1:index+win_size).*han_win;
    
    % FFT
    X = fft(temp_Y, fft_size);
    
    % update the stft matrix
    spec(:, col) = X(1:row_number);
    
    % update the index
    index = index + overlap;
end

% Output the time and frequency vectors 
t = (0:overlap:Ylen)/fs;
f = (0:row_number-1)*fs/fft_size;

end