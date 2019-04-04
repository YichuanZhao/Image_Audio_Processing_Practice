function sound = generate_triangle(time, fs, lowf)

%length of a single segment
%time=0.15;

% Create time interval from 0 to time
t = 0 : 1/fs : time;

% base frequency values
%lowf = 2000;
lowscale = 115;

sound = [];

triangle = 0 : 1/fs : time;

% generate the triangle wave function
% for N=1:4
%     
%     triangle = triangle + wave;
% end

% generate 5 periods of the siren
for v = 1:5 
    %generate the up
    
    for stair = 0:10
    
        triangle = (2*lowf*(t-(1/lowf).*floor(t.*lowf + 1/2)).*(-1).^(floor(t*lowf + 1/2)));
        lowf = lowf + lowscale;
        
        %add this segment to the sound
        sound = [sound, triangle];
    end

    %generate the down
    for stair = 0:10
        triangle = (2*lowf*(t-(1/lowf).*floor(t.*lowf + 1/2)).*(-1).^(floor(t*lowf + 1/2)));

        lowf = lowf - lowscale;
        
        sound = [sound, triangle];
    end
end

end

