function ReDataCapture
    format long;
    Count = 0;
    Total = 16;
    Array = 16;
    Power = Total - Array;

    fprintf('\n 1 : Error of Mitchell Approximation');
    fprintf('\n 2 : Error of Range Mapping (4-region)');
    fprintf('\n 3 : Error of ReMapping '); 
    fprintf('\n\n');
    fprintf('\n11 : Percentage Error of Mitchell Approximation');
    fprintf('\n12 : Percentage Error of Range Mapping (4-region)');
    fprintf('\n13 : Percentage Error of ReMapping '); 
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
    parpool local;                                                              %start parallel computing

    for Multiplier = 0 : 2^Power - 1
        Count = Count + 1;
        disp(Count); 
        Num = ((Multiplier * 2^Array) + 1) : ((Multiplier + 1) * 2^Array);
        parfor (i = 1 : 2^Array)
            %disp(['a', num2str(Count)]); 
            switch Choice
                case {1}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoMitchell(Num(i));
                case {2}
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoRangeMapping4(Num(i));
                case {3} 
                    Result(i) = AlgoLogarithm(Num(i)) - AlgoReMapping_fit(Num(i)); 
                case {11}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoMitchell(Num(i))) / Logarithm(Num(i)) * 100;
                case {12}
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoRangeMapping4(Num(i))) / AlgoLogarithm(Num(i)) * 100;
                case {13} 
                    Result(i) = (AlgoLogarithm(Num(i)) - AlgoReMapping_fit(Num(i))) / AlgoLogarithm(Num(i)) * 100; 
            end
        end
        fwrite(File, Result, 'float32');                                        %write result into binary file with float32 format
        if Count == 256                                                         %allow only parallel computing workers to work 256 times.
            disp(['b', num2str(Count)]); 
            delete(gcp('nocreate'));                                            %dismiss parallel computing workers / free memory space
            Count = 0;
            parpool local;                                                      %start parallel computing
        end
    end
    delete(gcp('nocreate'));                                                    %stop parallel computing

    fclose('all');
    toc;
    fprintf('\n\n');
end