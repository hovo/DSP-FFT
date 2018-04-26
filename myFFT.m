% Radix-2 FFT algorithm
function out = myFFT(x)
len = length(x);

% Zero pad x(n) if the input length is not a power of 2
if(rem(log2(len), 1) ~= 0)
    p = nextpow2(len);
    x = [x zeros(1, 2^p - len)];
    len = length(x); % update the length
end

% Get even and odd
x_even = x(2:2:len);
x_odd = x(1:2:(len-1));

w = exp(-2*pi*1i/len).^(0:len/2-1);

if len == 1
    out = x;
else
    even = myFFT(x_even);
    odd = myFFT(x_odd);
    
    z = w.*even;
    out = [odd + z, odd - z];
end
