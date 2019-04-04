function X_k = test_fft(x_n, N)

len = length(x_n);

x_n_t = [x_n zeros(1,N-len)];

X_k = zeros(1,N);

for k=1:N-1
    for n=0:N-1
        
        X_k(k+1) = X_k(k+1) + x_n_t(n+1)*exp(-j*2*pi*k*n/N);
        
    end  
end


