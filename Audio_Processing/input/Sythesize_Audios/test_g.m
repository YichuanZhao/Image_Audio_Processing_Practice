clear;clc;
%initialize the sound samples array
soundarr=[];

%set the sample rate
fs = 48000;

%length of a single segment
%time=0.01875;
time = 0.023;

% Create time interval from 0 to time
t = 0 : 1/fs : time;

% base frequency values
lowf = 450;
lowscale = 100;

triangle = 0 : 1/fs : time;

% generate the triangle wave function
% for N=1:4
%     
%     triangle = triangle + wave;
% end

% generate 5 periods of the siren
for v = 1:16 
    %generate the up
    for stair = 0:8
        triangle = (2*lowf*(t-(1/lowf).*floor(t.*lowf + 1/2)).*(-1).^(floor(t*lowf + 1/2)));
        lowf = lowf + lowscale;
        
        %add this segment to the sound
        soundarr = [soundarr, triangle];
    end
    
    %generate the down
    for stair = 0:8
        triangle = (2*lowf*(t-(1/lowf).*floor(t.*lowf + 1/2)).*(-1).^(floor(t*lowf + 1/2)));

        lowf = lowf - lowscale;
        
        soundarr = [soundarr, triangle];
    end
end

%display the spectrogram
figure; spectrogram(soundarr,512,256,512,fs, 'yaxis');

%play the sound
%sound(soundarr,fs);

%save the sound to file
audiowrite('siren1_test.wav', soundarr, fs);