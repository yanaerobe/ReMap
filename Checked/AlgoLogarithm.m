function Result = AlgoLogarithm(Num)
    [k, m] = KeyValues(Num);                            %calculate position of leading one & mantissa
    Result = k + log2(1 + m);                           %formula for logarithm
end