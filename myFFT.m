% Radix-2 Decimation in Time FFT algorithm
function out = myFFT(x)
len = length(x);

% Zero pad x(n) if the input length is not a power of 2
if(rem(log2(len), 1) ~= 0)
    p = nextpow2(len);
    x = [x zeros(1, 2^p - len)];
    len = length(x); % update the length
end

% Get even and 
x_even = x(2:2:len);
x_odd = x(1:2:len);

if len == 1
    out = x;
else
    y_0 = myFFT(x_even);
    y_1 = myFFT(x_odd);
    w = exp(-2*pi*1i/len).^(0:len/2-1);
    z = w.*y_1;
    out = [y_0 + z, y_1 - z];
end


