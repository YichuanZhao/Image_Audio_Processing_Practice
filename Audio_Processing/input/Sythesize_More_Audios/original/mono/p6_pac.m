clear;clc;
%initialize the sound samples array
%soundarr=[];

%set the sample rate
fs = 44100;

%length of a single segment
time=0.02;

lowf_1 = 1000;
lowf_2 = 2000;
lowf_3 = 4500;


pac_sound = zeros(1,fs*3);

% sound_1 = generate_triangle(time, fs, lowf_1);
% sound_2 = generate_triangle(time, fs, lowf_2);
% sound_3 = generate_triangle(time, fs, lowf_3);

%sound = sound_1 + sound_2 + sound_3;

sound_1 = generate_segment_signal(time,fs,lowf_1, lowf_2, lowf_3, 0);

sound_2 = generate_segment_signal(time,fs,lowf_1, lowf_2, lowf_3, 200);

sound_3 = generate_segment_signal(time,fs,lowf_1, lowf_2, lowf_3, 400);

sound_4 = generate_segment_signal(time,fs,lowf_1, lowf_2, lowf_3, 600);

sound_5 = generate_segment_signal(time,fs,lowf_1, lowf_2, lowf_3, 800);


pac_sound(1:10001) = sound_1;
pac_sound(10002:20002) = sound_2;
pac_sound(20003:30003) = sound_3;
pac_sound(30004:40004) = sound_4;
pac_sound(40005:50005) = sound_5;




% t = 0:1/fs:1;
% x_1 = cos(2*pi*10000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));
% 
% x_2 = cos(2*pi*8000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));
% 
% x_3 = cos(2*pi*4000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));
% 
% x_4 = cos(2*pi*1200*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));
% 
% x_5 = cos(2*pi*12000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));
% 
% x_6 = cos(2*pi*14000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));
% 
% x_7 = cos(2*pi*16000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));
% 
% 
% 
% x = 0.05*x_1 + 0.1*x_2 + 0.2*x_3 + 0.5*x_4 + 0.01*x_5 + 0.01*x_6 + 0.01*x_7;
% 
% K = zeros(1,2*length(x));
% K(1:length(x)/2) = x(1:length(x)/2);

%K = 0.5*K;

% test_s = zeros(1, length(sound));
% test_s(15000:25000) = sound(15000:25000);
% soundarr = 0.11*soundarr;
% plot(soundarr(1:826));
% %display the spectrogram
figure; spectrogram(pac_sound,512,256,512,fs, 'yaxis');
%figure; spectrogram(test_s,512,256,512,fs, 'yaxis');
%
%play the sound
%sound(soundarr,fs);

%save the sound to file
audiowrite('pac-generated.wav', pac_sound, fs);