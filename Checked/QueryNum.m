function QueryNum
    format long;
    while(1)
        fprintf('\n\n\n');
        Num = input('Please Insert Number (0 to Quit) : ');
        
        if Num == 0
            fprintf('\n\n');
            break;
        end
        
        Result1 = AlgoLogarithm(Num);                   %calculate Actual logarithm answer
        Result2 = AlgoMitchell(Num);                    %calculate Mitchell approximation
        Result3 = AlgoRangeMapping4(Num);               %calculate Range Mapping (4 region) approximation
        Result4 = AlgoReMapping_16bit(Num);             %calculate ReMapping approximation
        
        Error2 = Result1 - Result2;                     %calculate approximation error of Mitchell
        Error3 = Result1 - Result3;                     %calculate approximation error of Range Mapping (4 region) approximation
        Error4 = Result1 - Result4;                     %calculate approximation error of ReMapping apprximation
        
        fprintf('\nActual Logarithm \t\t\t\t\t\t= %.9f', Result1);
        fprintf('\nMitchell Approximation \t\t\t\t\t= %.9f, Error = %+.9f', Result2, Error2);
        fprintf('\nRange Mapping (4 region) Approximation \t= %.9f, Error = %+.9f', Result3, Error3);
        fprintf('\nReMapping Approximation \t\t\t\t= %.9f, Error = %+.9f', Result4, Error4);
        
    end
end