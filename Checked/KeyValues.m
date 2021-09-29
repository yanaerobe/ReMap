function [k, m] = KeyValues(Num)
    for k = 32 : -1 : -1                                %for a max of 32 bit number
        if bitshift(Num, -k) == 1                       %detect for leading one
            break;                                      %k = position of leading one
        end
    end
    if k == -1                                          %handle for number = 0
        k = 0;                                          %position = 0
        m = 0;                                          %mantissa = 0
    else
        m = (Num / 2^k) - 1;                            %calculate mantissa
    end
end