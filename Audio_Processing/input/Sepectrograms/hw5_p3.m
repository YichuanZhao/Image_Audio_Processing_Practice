%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read from a WAV file and plot the Spectrogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear;clc;
%[Y,fs]=audioread('01-extralife.wav'); % read the WAV file
%[Y,fs] = audioread('02-siren1.wav');
%[Y,fs] = audioread('03-fruiteaten.wav');
%[Y,fs] = audioread('04-ghosteaten.wav');
[Y,fs] = audioread('05-pacmandeath.wav');

Y = Y(:, 1);                        

% Y   - audio data samples
% 512 - window size  (in samples)
% 256 - overlap      (in samples)
% 512 - FFT size     (in samples)
% fs  - sampling frequency (in Hz)
Ylen = length(Y);                   
window_size = 512;                        
overlap = 256;                       
fft_size = 512;                  

[S, f, t] = test_stft(Y, window_size, overlap, fft_size, fs);

% take amplitude and scale it, as applied hamming window in stft()
K = sum(hamming(window_size, 'periodic'))/window_size;
S = abs(S)/window_size/K;

S = 20*log10(S + 1e-8);

figure;
h1 = axes;
imagesc(t,f/1000,S);
colorbar;
xlabel('Time (Sec)');
ylabel('Frequency (kHz)');

set(gca,'YDir','normal');

% figure;
% plot(1:1000,Y(1:1000), 'b.')     % plot the first 1000 samples 
% xlabel('Sample number (only the first 1000)');
% ylabel('Y');
% title('The wave for a 440 Hz sine, sampled at 44,100 Hz');
% 
% 
% % 'yaxis' - put the frequencies along the y axis
% figure; spectrogram(Y(:,1), 512, 256, 512, fs, 'yaxis'); 
% title('Spectrogram for 440 Hz Sine');
% % 
% % % store the spectrogram data in the complex matrix S
% % S=spectrogram(Y, 512, 256, 512, fs, 'yaxis');
% % 
% % % play it
% % sound(Y, fs)