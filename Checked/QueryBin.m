function QueryBin
    format long;
    while(1)
        fprintf('\n\n\n');
        Num = bin2dec(input('Please Insert Number (0 to Quit) : ', 's'));
        
        if Num == 0
            fprintf('\n\n');
            break;
        end
        
        Result1 = AlgoLogarithm(Num);                                       %calculate Actual logarithm answer
        Result2 = AlgoMitchell(Num);                                        %calculate Mitchell approximation
        Result3 = AlgoRangeMapping4(Num);                                   %calculate Range Mapping (4 region) approximation
        Result4 = AlgoReMapping_fit(Num);                                 %calculate ReMapping approximation
        
        Error2 = Result1 - Result2;                                         %calculate approximation error of Mitchell
        Error3 = Result1 - Result3;                                         %calculate approximation error of Range Mapping (4 region)
        Error4 = Result1 - Result4;                                         %calculate approximation error of ReMapping
        
        [Buffer, Result1Int, Result1Dec] = Conversion(Result1);             %binary conversion
        [Buffer, Result2Int, Result2Dec] = Conversion(Result2);             %binary conversion
        [Buffer, Result3Int, Result3Dec] = Conversion(Result3);             %binary conversion
        [Buffer, Result4Int, Result4Dec] = Conversion(Result4);             %binary conversion
        
        [ErrSign2, Error2Int, Error2Dec] = Conversion(Error2);              %binary conversion
        [ErrSign3, Error3Int, Error3Dec] = Conversion(Error3);              %binary conversion
        [ErrSign4, Error4Int, Error4Dec] = Conversion(Error4);              %binary conversion
        
        fprintf('\nActual Logarithm \t\t\t\t\t\t= %s.%s', Result1Int, Result1Dec);
        fprintf('\nMitchell Approximation \t\t\t\t\t= %s.%s, Error = %s%s.%s', Result2Int, Result2Dec, ErrSign2, Error2Int, Error2Dec);
        fprintf('\nRange Mapping (4 region) Approximation \t= %s.%s, Error = %s%s.%s', Result3Int, Result3Dec, ErrSign3, Error3Int, Error3Dec);
        fprintf('\nReMapping Approximation \t\t\t\t= %s.%s, Error = %s%s.%s', Result4Int, Result4Dec, ErrSign4, Error4Int, Error4Dec);
    end
end

function [Sign, Integer, Decimal] = Conversion(Number)
    if Number < 0
        Number = -Number;
        Sign = '-';
    else
        Sign = '+';
    end
    Integer = floor(Number);                            %retrieve k value
    Decimal = Number - Integer;                         %retrieve m value
    Integer = dec2bin(Integer, 5);                      %convert to 5-bit binary
    Decimal = dec2bin((Decimal * 2^27), 27);            %convert to 27-bit binary
end