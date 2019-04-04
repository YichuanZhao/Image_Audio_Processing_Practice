%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Read from a WAV file and plot the Spectrogram
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

[X,fs]=audioread('01-extralife.wav'); % read the WAV file
% figure;
index = 1;
Y = X(:,1);
plot(index:index+10000,Y(index:index+10000), 'b.')     % plot the first 1000 samples 
% xlabel('Sample number (only the first 1000)');
% ylabel('Y');
% title('The wave for a 440 Hz sine, sampled at 44,100 Hz');

% Y   - audio data samples
% 512 - window size  (in samples)
% 256 - overlap      (in samples)
% 512 - FFT size     (in samples)
% fs  - sampling frequency (in Hz)
% 'yaxis' - put the frequencies along the y axis
%figure; spectrogram(Y(:,1), 512, 256, 512, fs, 'yaxis'); 
%title('Spectrogram for 440 Hz Sine');

% % store the spectrogram data in the complex matrix S
% S=spectrogram(Y, 512, 256, 512, fs, 'yaxis');
% 
% % play it
% sound(Y, fs)