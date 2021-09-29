function decbin(x)
%x = floor(((2-log2(5)) + (log2(1+0.25)-0.25*1.125))*2^11 + 0.5) / 2^11; 
disp(x); 
N = 11; 
bin = zeros(1, N); 

while (N ~= 0) 
    x = x*2; 
    if (x >= 1) 
        bin(1, 12-N) = 1; 
        x = x-1; 
    else 
        bin(1, 12-N) = 0; 
    end 
    disp(x); 
    N = N-1; 
end

disp(bin); 