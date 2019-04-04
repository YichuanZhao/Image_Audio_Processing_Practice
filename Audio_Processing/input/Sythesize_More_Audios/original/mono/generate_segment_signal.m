function test_s = generate_segment_signal(time, fs, lowf_1, lowf_2, lowf_3, p)

sound_1 = generate_triangle(time, fs, lowf_1 -p);
sound_2 = generate_triangle(time, fs, lowf_2 -p);
sound_3 = generate_triangle(time, fs, lowf_3 - p);

sound = sound_1 + sound_2 + sound_3;

%test_s = zeros(1, length(sound));
test_s = sound(15000:25000);

end

