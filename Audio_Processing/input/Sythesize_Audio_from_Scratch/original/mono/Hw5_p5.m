%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GENERATE A SINE WAVE AT 440 Hz for 5 seconds
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

f_1= 400;                               % frequency of the signal
f_2 = 700;
f_3 = 2000;
f_4 = 3000;
f_5 = 9000;
f_6 = 15000;
f_7 = 21000;

fs = 44100;                          % sampling frequency (in Hz)
nsec = 5;                            % number of seconds
n = 1:fs*nsec;                       % samples


y_1 = generate_wave(fs*nsec, f_1, fs, n);
y_2 = generate_wave(fs*nsec, f_2, fs, n);
y_3 = generate_wave(fs*nsec, f_3, fs, n);
y_4 = generate_wave(fs*nsec, f_4, fs, n);
y_5 = generate_wave(fs*nsec, f_5, fs, n);
y_6 = generate_wave(fs*nsec, f_6, fs, n);
y_7 = generate_wave(fs*nsec, f_7, fs, n);



y = y_1 + 0.2*y_2 + 0.9*y_3 + 0.9*y_4 + 0.4*y_5 + 0.2*y_6 + 0.2*y_7;

y = 0.2*y;
% 
% temp_1 = ones(1,fs*nsec);
% 
% k = 1;
% for mm=1:200
%     
%     temp_1((mm*1000 + 1):(mm*1000 + 1000)) = k;
%     if mod(mm,8) == 0
%         k = 1;
%     else
%         k = k - 0.1;
%     end
%         
% end
% 
% y_1 = temp_1.*sin(2*pi*n*f_1/fs);                % generate the signal
% 
% 
% temp_2 = ones(1,fs*nsec);
% 
% k = 1;
% for mm=1:200
%     
%     temp_2((mm*1000 + 1):(mm*1000 + 1000)) = k;
%     if mod(mm,8) == 0
%         k = 1;
%     else
%         k = k - 0.1;
%     end
%         
% end
% 
% y_2 = 0.2*temp_2.*sin(2*pi*n*f_2/fs);                % generate the signal
% 
% temp_3 = ones(1,fs*nsec);
% 
% k = 1;
% for mm=1:200
%     
%     temp_3((mm*1000 + 1):(mm*1000 + 1000)) = k;
%     if mod(mm,8) == 0
%         k = 1;
%     else
%         k = k - 0.1;
%     end
%         
% end
% 
% y_3 = 0.1*temp_3.*sin(2*pi*n*f_3/fs);                % generate the signal
% 
% temp_4 = ones(1,fs*nsec);
% 
% k = 1;
% for mm=1:200
%     
%     temp_4((mm*1000 + 1):(mm*1000 + 1000)) = k;
%     if mod(mm,8) == 0
%         k = 1;
%     else
%         k = k - 0.1;
%     end
%         
% end
% 
% y_4 = 0.2*temp_4.*sin(2*pi*n*f_4/fs);                % generate the signal


%sound(y, fs)                         % play this on the speakers
audiowrite('extralife-generated.wav', y, fs); % save it to a WAV file
