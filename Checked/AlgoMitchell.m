function Result = AlgoMitchell(Num)
    [k, m] = KeyValues(Num);                            %calculate position of leading one & mantissa
    m_Truncated = floor(m * 2^27) / 2^27;               %limit mantissa to 27 bits
    Result = k + m_Truncated;                           %result of Mitchell approximation
end