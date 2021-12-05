function DataCapture
    format long;
    Count = 0;
    Total = 32;
    Array = 20;
    Power = Total - Array;

    fprintf('\n  1 : Error of Mitchell Approximation');
    fprintf('\n  2 : Error of Combet Approximation (All-bit)');
    fprintf('\n  3 : Error of Combet Approximation (7-bit)');
    fprintf('\n  4 : Error of Abed & Siferd Approximation (2-Region)');
    fprintf('\n  5 : Error of Abed & Siferd Approximation (3-Region)');
    fprintf('\n  6 : Error of Abed & Siferd Approximation (6-Region)');
    fprintf('\n  7 : Error of Hall Approximation');
    fprintf('\n  8 : Error of SanGregory Approximation');
    fprintf('\n  9 : Error of Li Approximation');
    fprintf('\n 10 : Error of Juang Approximation');
    fprintf('\n 11 : Error of Kim Approximation');
    fprintf('\n 12 : Error of Range Mapping Approximation');
    fprintf('\n 13 : Error of Gutierrez Approximation');
    fprintf('\n 14 : Error of De Caro Approximation (8-region)');
    fprintf('\n 15 : Error of De Caro Approximation (4-region)');
    fprintf('\n 16 : Error of De Caro Approximation (2-region)');
    fprintf('\n 17 : Error of Range Mapping Approximation (4-region)');
    fprintf('\n\n');
    fprintf('\n101 : Percentage Error of Mitchell Approximation');
    fprintf('\n102 : Percentage Error of Combet Approximation (All-bit)');
    fprintf('\n103 : Percentage Error of Combet Approximation (7-bit)');
    fprintf('\n104 : Percentage Error of Abed & Siferd Approximation (2-Region)');
    fprintf('\n105 : Percentage Error of Abed & Siferd Approximation (3-Region)');
    fprintf('\n106 : Percentage Error of Abed & Siferd Approximation (6-Region)');
    fprintf('\n107 : Percentage Error of Hall Approximation');
    fprintf('\n108 : Percentage Error of SanGregory Approximation');
    fprintf('\n109 : Percentage Error of Li Approximation');
    fprintf('\n110 : Percentage Error of Juang Approximation');
    fprintf('\n111 : Percentage Error of Kim Approximation');
    fprintf('\n112 : Percentage Error of Range Mapping Approximation');
    fprintf('\n113 : Percentage Error of Gutierrez Approximation');
    fprintf('\n114 : Percentage Error of De Caro Approximation (8-region)');
    fprintf('\n115 : Percentage Error of De Caro Approximation (4-region)');
    fprintf('\n116 : Percentage Error of De Caro Approximation (2-region)');
    fprintf('\n117 : Percentage Error of Range Mapping Approximation (4-region)');
    fprintf('\n');
    fprintf('\n0 : Quit');
    fprintf('\n\n');
    Choice = input('Please Insert Choice : ');

    if Choice == 0
        return
    end
    
    FileName = uiputfile({'*.bin', 'Binary File (*.bin)'}, 'Save As');          %save as binary file
    if FileName == 0                                                            %quit when no filename is given
        fprintf('\n\n');
        return;
    end
    File = fopen(FileName, 'w');                                                %create binary file
    Result = zeros(1, 2^Array);                                                 %prepare memory space for variable
    
    tic;
    matlabpool open;                                                            %start parallel computing

    for Multiplier = 0 : 2^Power - 1
        Count = Count + 1;
        Num = ((Multiplier * 2^Array) + 1) : ((Multiplier + 1) * 2^Array);
        parfor (i = 1 : 2^Array)
            switch Choice
                case {1}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoMitchell(Num(i));
                case {2}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoCombet(Num(i));
                case {3}
                    %Result(i) = AlgoLogarithm(Num(i)) - AlgoCombet7(Num(i));
                case {4}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoAbedSiferd2(Num(i));
                case {5}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoAbedSiferd3(Num(i));
                case {6}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoAbedSiferd6(Num(i));
                case {7}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoHall(Num(i));
                case {8}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoSanGregory(Num(i));
                case {9}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoLi(Num(i));
                case {10}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoJuang(Num(i));
                case {11}
                    Result(i) = AlgoLogarithm(Num(i)) - Algokim(Num(i));
                case {12}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoRangeMapping(Num(i));
                case {13}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoGutierrez(Num(i));
                case {14}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoDeCaro8(Num(i));
                case {15}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoDeCaro4(Num(i));
                case {16}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoDeCaro2(Num(i));
                case {17}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoRangeMapping4(Num(i));
                case {101}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoMitchell(Num(i))) / Logarithm(Num(i)) * 100;
                case {102}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoCombet(Num(i))) / Logarithm(Num(i)) * 100;
                case {103}
                    %Result(i) = (AlgoLogarithm(Num(i)) - Combet7(Num(i))) / Logarithm(Num(i)) * 100;
                case {104}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoAbed2(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {105}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoAbed3(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {106}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoAbed6(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {107}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoHall(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {108}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoSanGregory(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {109}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoLi(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {110}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoJuang(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {111}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoKim(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {112}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoRangeMapping(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {113}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoGutierrez(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {114}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoDeCaro8(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {115}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoDeCaro4(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {116}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoDeCaro2(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {117}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoRangeMapping4(Num(i))) / AlgoLogarithm(Num(i)) * 100;
            end
        end
        fwrite(File, Result, 'float32');                                        %write result into binary file with float32 format
        if Count == 256                                                         %allow only parallel computing workers to work 256 times.
            matlabpool close;                                                   %dismiss parallel computing workers / free memory space
            Count = 0;
            matlabpool open;                                                    %start parallel computing
        end
    end
    matlabpool close;                                                           %stop parallel computing

    fclose('all');
    toc;
    fprintf('\n\n');
end