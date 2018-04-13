% Radix-2 Decimation in Frequency FFT algorithm
function out = myFFT(x)
len = length(x);

% Zero pad x(n) if the input length is not a power of 2
if(rem(log2(len), 1) ~= 0)
    p = nextpow2(len);
    x = [x zeros(1, 2^p - len)];
end
out = x;

% Permute data into bit-reversed order
