clear;clc;
%initialize the sound samples array
%soundarr=[];

%set the sample rate
fs = 44100;

%length of a single segment
time_1=0.15;
time_2 = 0.1;
time_3 = 0.05;
time_4 = 0.01;

lowf = 1000;

sound_1 = generate_triangle(time_1, fs, lowf);
sound_2 = generate_triangle(time_2, fs, lowf);
sound_3 = generate_triangle(time_3, fs, lowf);
sound_4 = generate_triangle(time_4, fs, lowf);

%sound = sound_1 + sound_2 + sound_3 + sound_4;

t = 0:1/fs:1;
x_1 = cos(2*pi*10000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));

x_2 = cos(2*pi*8000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));

x_3 = cos(2*pi*4000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));

x_4 = cos(2*pi*1200*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));

x_5 = cos(2*pi*12000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));

x_6 = cos(2*pi*14000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));

x_7 = cos(2*pi*16000*t.^2 + 2*pi*100*t + 2*pi*rand(1,1));



x = 0.05*x_1 + 0.1*x_2 + 0.2*x_3 + 0.5*x_4 + 0.01*x_5 + 0.01*x_6 + 0.01*x_7;

K = zeros(1,2*length(x));
K(1:length(x)/2) = x(1:length(x)/2);

%K = 0.5*K;

test_s = zeros(1, length(sound_1));
test_s(100000:200000) = sound_1(100000:200000);
% soundarr = 0.11*soundarr;
% plot(soundarr(1:826));
% %display the spectrogram
figure; spectrogram(K,512,256,512,fs, 'yaxis');
%figure; spectrogram(test_s,512,256,512,fs, 'yaxis');
%
%play the sound
%sound(soundarr,fs);

%save the sound to file
audiowrite('ghost-generated.wav', K, fs);