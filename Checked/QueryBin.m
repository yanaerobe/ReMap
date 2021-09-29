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
        Result3 = AlgoCombet(Num);                                          %calculate Combet approximation
%         Result4 = Combet7(Num);                                             %calculate Combet approximation (7-bit mantissa)
%         Result5 = AlgoAbed2(Num);                                           %calculate Abed & Siferd approximation (2 region)
%         Result6 = AlgoAbed3(Num);                                           %calculate Abed & Siferd approximation (3 region)
%         Result7 = AlgoAbed6(Num);                                           %calculate Abed & Siferd approximation (6 region)
        Result8 = AlgoHall(Num);                                            %calculate Hall approximation
%         Result9 = AlgoSanGregory(Num);                                      %calculate SanGregory approximation
%         Result10 = AlgoLi(Num);                                             %calculate Li approximation
%         Result11 = AlgoJuang(Num);                                          %calculate Juang approximation
%         Result12 = AlgoRangeMapping(Num);                                   %calculate Range Mapping approximation
%         Result13 = AlgoKim(Num);                                            %calculate Kim8 approximation
%         Result14 = AlgoRangeMapping4(Num);                                  %calculate Range Mapping (4 region) approximation
%         Result15 = AlgoDeCaro8(Num);                                        %calculate De Caro (8 region) approximation      
%         Result16 = AlgoGutierrez(Num);                                      %calculate Gutierrez (4 region) approximation  
%         Result15 = AlgoDeCaro8(Num);                                        %calculate De Caro (8 region) approximation        
%         Result16 = AlgoGutierrez(Num);                                      %calculate Gutierrez (4 region) approximation   
%         Result17 = AlgoDeCaro2(Num);                                        %calculate De Caro (2 region) approximation    
%         Result18 = AlgoDeCaro4(Num);                                        %calculate De Caro (4 region) approximation     
        
        Error2 = Result1 - Result2;                                         %calculate approximation error of Mitchell
        Error3 = Result1 - Result3;                                         %calculate approximation error of Combet
%         Error4 = Result1 - Result4;                                         %calculate approximation error of Combet (7-bit mantissa)
%         Error5 = Result1 - Result5;                                         %calculate approximation error of Abed & Siferd (2 region)
%         Error6 = Result1 - Result6;                                         %calculate approximation error of Abed & Siferd (3 region)
%         Error7 = Result1 - Result7;                                         %calculate approximation error of Abed & Siferd (6 region)
        Error8 = Result1 - Result8;                                         %calculate approximation error of Hall approximation
%         Error9 = Result1 - Result9;                                         %calculate approximation error of SanGregory approximation
%         Error10 = Result1 - Result10;                                       %calculate approximation error of Li approximation
%         Error11 = Result1 - Result11;                                       %calculate approximation error of Juang approximation
%         Error12 = Result1 - Result12;                                       %calculate approximation error of Range Mapping approximation
%         Error13 = Result1 - Result13;                                       %calculate approximation error of Kim8 approximation
%         Error14 = Result1 - Result14;                                       %calculate approximation error of Range Mapping (4 region) approximation
%         Error15 = Result1 - Result15;                                       %calculate approximation error of De Caro (8 region) approximation
%         Error16 = Result1 - Result16;                                       %calculate approximation error of Gutierrez (4 region) approximation
%         Error17 = Result1 - Result17;                                       %calculate approximation error of De Caro (2 region) approximation 
%         Error18 = Result1 - Result18;                                       %calculate approximation error of De Caro (4 region) approximation 
        
        [Buffer, Result1Int, Result1Dec] = Conversion(Result1);             %binary conversion
        [Buffer, Result2Int, Result2Dec] = Conversion(Result2);             %binary conversion
        [Buffer, Result3Int, Result3Dec] = Conversion(Result3);             %binary conversion
%         [Buffer, Result4Int, Result4Dec] = Conversion(Result4);             %binary conversion
%         [Buffer, Result5Int, Result5Dec] = Conversion(Result5);             %binary conversion
%         [Buffer, Result6Int, Result6Dec] = Conversion(Result6);             %binary conversion
%         [Buffer, Result7Int, Result7Dec] = Conversion(Result7);             %binary conversion
        [Buffer, Result8Int, Result8Dec] = Conversion(Result8);             %binary conversion
%         [Buffer, Result9Int, Result9Dec] = Conversion(Result9);             %binary conversion
%         [Buffer, Result10Int, Result10Dec] = Conversion(Result10);          %binary conversion
%         [Buffer, Result11Int, Result11Dec] = Conversion(Result11);          %binary conversion
%         [Buffer, Result12Int, Result12Dec] = Conversion(Result12);          %binary conversion
%         [Buffer, Result13Int, Result13Dec] = Conversion(Result13);          %binary conversion
%         [Buffer, Result14Int, Result14Dec] = Conversion(Result14);          %binary conversion        
%         [Buffer, Result15Int, Result15Dec] = Conversion(Result15);          %binary conversion    
%         [Buffer, Result16Int, Result16Dec] = Conversion(Result16);          %binary conversion       
%         [Buffer, Result17Int, Result17Dec] = Conversion(Result17);          %binary conversion        
%         [Buffer, Result18Int, Result18Dec] = Conversion(Result18);          %binary conversion   
        
        [ErrSign2, Error2Int, Error2Dec] = Conversion(Error2);              %binary conversion
        [ErrSign3, Error3Int, Error3Dec] = Conversion(Error3);              %binary conversion
%         [ErrSign4, Error4Int, Error4Dec] = Conversion(Error4);              %binary conversion
%         [ErrSign5, Error5Int, Error5Dec] = Conversion(Error5);              %binary conversion
%         [ErrSign6, Error6Int, Error6Dec] = Conversion(Error6);              %binary conversion
%         [ErrSign7, Error7Int, Error7Dec] = Conversion(Error7);              %binary conversion
        [ErrSign8, Error8Int, Error8Dec] = Conversion(Error8);              %binary conversion
%         [ErrSign9, Error9Int, Error9Dec] = Conversion(Error9);              %binary conversion
%         [ErrSign10, Error10Int, Error10Dec] = Conversion(Error10);          %binary conversion
%         [ErrSign11, Error11Int, Error11Dec] = Conversion(Error11);          %binary conversion
%         [ErrSign12, Error12Int, Error12Dec] = Conversion(Error12);          %binary conversion
%         [ErrSign13, Error13Int, Error13Dec] = Conversion(Error13);          %binary conversion
%         [ErrSign14, Error14Int, Error14Dec] = Conversion(Error14);          %binary conversion        
%         [ErrSign15, Error15Int, Error15Dec] = Conversion(Error15);          %binary conversion   
%         [ErrSign16, Error16Int, Error16Dec] = Conversion(Error16);          %binary conversion        
%         [ErrSign17, Error17Int, Error17Dec] = Conversion(Error17);          %binary conversion        
%         [ErrSign18, Error18Int, Error18Dec] = Conversion(Error18);          %binary conversion    
        
        fprintf('\nActual Logarithm \t\t\t\t\t\t= %s.%s', Result1Int, Result1Dec);
        fprintf('\nMitchell Approximation \t\t\t\t\t= %s.%s, Error = %s%s.%s', Result2Int, Result2Dec, ErrSign2, Error2Int, Error2Dec);
        fprintf('\nCombet Approximation (All-bit) \t\t\t= %s.%s, Error = %s%s.%s', Result3Int, Result3Dec, ErrSign3, Error3Int, Error3Dec);
%         fprintf('\nCombet Approximation (7-bit) \t\t\t= %s.%s, Error = %s%s.%s', Result4Int, Result4Dec, ErrSign4, Error4Int, Error4Dec);
%         fprintf('\nAbed & Siferd Approximation (2-Region) \t= %s.%s, Error = %s%s.%s', Result5Int, Result5Dec, ErrSign5, Error5Int, Error5Dec);
%         fprintf('\nAbed & Siferd Approximation (3-Region) \t= %s.%s, Error = %s%s.%s', Result6Int, Result6Dec, ErrSign6, Error6Int, Error6Dec);
%         fprintf('\nAbed & Siferd Approximation (6-Region) \t= %s.%s, Error = %s%s.%s', Result7Int, Result7Dec, ErrSign7, Error7Int, Error7Dec);
        fprintf('\nHall Approximation \t\t\t\t\t\t= %s.%s, Error = %s%s.%s', Result8Int, Result8Dec, ErrSign8, Error8Int, Error8Dec);
%         fprintf('\nSanGregory Approximation \t\t\t\t= %s.%s, Error = %s%s.%s', Result9Int, Result9Dec, ErrSign9, Error9Int, Error9Dec);
%         fprintf('\nLi Approximation \t\t\t\t\t\t= %s.%s, Error = %s%s.%s', Result10Int, Result10Dec, ErrSign10, Error10Int, Error10Dec);
%         fprintf('\nJuang Approximation \t\t\t\t\t= %s.%s, Error = %s%s.%s', Result11Int, Result11Dec, ErrSign11, Error11Int, Error11Dec);
%         fprintf('\nRange Mapping Approximation \t\t\t= %s.%s, Error = %s%s.%s', Result12Int, Result12Dec, ErrSign12, Error12Int, Error12Dec);
%         fprintf('\nKim Approximation \t\t\t\t\t\t= %s.%s, Error = %s%s.%s', Result13Int, Result13Dec, ErrSign13, Error13Int, Error13Dec);
%         fprintf('\nRange Mapping (4 region) Approximation \t= %s.%s, Error = %s%s.%s', Result14Int, Result14Dec, ErrSign14, Error14Int, Error14Dec);        
%         fprintf('\nDe Caro (8 region) Approximation \t\t= %s.%s, Error = %s%s.%s', Result15Int, Result15Dec, ErrSign15, Error15Int, Error15Dec);     
%         fprintf('\nGutierrez (4 region) approximation \t\t= %s.%s, Error = %s%s.%s', Result16Int, Result16Dec, ErrSign16, Error16Int, Error16Dec);          
%         fprintf('\nDe Caro (2 region) Approximation \t\t= %s.%s, Error = %s%s.%s', Result17Int, Result17Dec, ErrSign17, Error17Int, Error17Dec);          
%         fprintf('\nDe Caro (4 region) Approximation \t\t= %s.%s, Error = %s%s.%s', Result18Int, Result18Dec, ErrSign18, Error18Int, Error18Dec);   
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