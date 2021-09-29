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
        Result3 = AlgoCombet(Num);                      %calculate Combet approximation
        %Result4 = Combet7(Num);                         %calculate Combet approximation (7-bit mantissa)
        Result5 = AlgoAbed2(Num);                       %calculate Abed & Siferd approximation (2 region)
        Result6 = AlgoAbed3(Num);                       %calculate Abed & Siferd approximation (3 region)
        Result7 = AlgoAbed6(Num);                       %calculate Abed & Siferd approximation (6 region)
        Result8 = AlgoHall(Num);                        %calculate Hall approximation
        Result9 = AlgoSanGregory(Num);                  %calculate SanGregory approximation
        Result10 = AlgoLi(Num);                         %calculate Li approximation
        Result11 = AlgoJuang(Num);                      %calculate Juang approximation
        
        Error2 = Result1 - Result2;                     %calculate approximation error of Mitchell
        Error3 = Result1 - Result3;                     %calculate approximation error of Combet
        %Error4 = Result1 - Result4;                     %calculate approximation error of Combet (7-bit mantissa)
        Error5 = Result1 - Result5;                     %calculate approximation error of Abed & Siferd (2 region)
        Error6 = Result1 - Result6;                     %calculate approximation error of Abed & Siferd (3 region)
        Error7 = Result1 - Result7;                     %calculate approximation error of Abed & Siferd (6 region)
        Error8 = Result1 - Result8;                     %calculate approximation error of Hall approximation
        Error9 = Result1 - Result9;                     %calculate approximation error of SanGregory approximation
        Error10 = Result1 - Result10;                   %calculate approximation error of Li approximation
        Error11 = Result1 - Result11;                   %calculate approximation error of Juang approximation
        
        fprintf('\nActual Logarithm \t\t\t\t\t\t= %.9f', Result1);
        fprintf('\nMitchell Approximation \t\t\t\t\t= %.9f, Error = %+.9f', Result2, Error2);
        fprintf('\nCombet Approximation (All-bit) \t\t\t= %.9f, Error = %+.9f', Result3, Error3);
        %fprintf('\nCombet Approximation (7-bit) \t\t\t= %.9f, Error = %+.9f', Result4, Error4);
        fprintf('\nAbed & Siferd Approximation (2-Region) \t= %.9f, Error = %+.9f', Result5, Error5);
        fprintf('\nAbed & Siferd Approximation (3-Region) \t= %.9f, Error = %+.9f', Result6, Error6);
        fprintf('\nAbed & Siferd Approximation (6-Region) \t= %.9f, Error = %+.9f', Result7, Error7);
        fprintf('\nHall Approximation \t\t\t\t\t\t= %.9f, Error = %+.9f', Result8, Error8);
        fprintf('\nSanGregory Approximation \t\t\t\t= %.9f, Error = %+.9f', Result9, Error9);
        fprintf('\nLi Approximation \t\t\t\t\t\t= %.9f, Error = %+.9f', Result10, Error10);
        fprintf('\nJuang Approximation \t\t\t\t\t= %.9f, Error = %+.9f', Result11, Error11);
    end
end