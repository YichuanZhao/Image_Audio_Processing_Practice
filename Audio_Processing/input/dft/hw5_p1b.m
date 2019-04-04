clear; clc;
s_two = sqrt(2)/2;

x = [0 s_two 1 s_two 0 -s_two -1 -s_two];

X_k = test_fft(x,8);
