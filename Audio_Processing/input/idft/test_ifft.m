function x_n = test_ifft(X_k,N)

len = length(X_k);

X_k = [X_k zeros(1,N-len)];

x_n = zeros(1, N);

for k=1:N-1
    for n=0:N-1
        
        x_n(k+1) = x_n(k+1) + X_k(n+1)*exp(j*2*pi*k*n/N);
        
    end  
    x_n(k+1) = x_n(k+1)/N;
    
end

end

