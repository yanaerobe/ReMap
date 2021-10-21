function ReMCheckAlgo
    clear;
    format long;
    Count = 0;
    Total = 12;
    Array = 12;
    Power = Total - Array;
    
    MinError = 0;                                       %variable to store algorithm's minimum error
    MaxError = 0;                                       %variable to store algorithm's maximum error
    MinPercent = 0;                                     %variable to store algorithm's minimum percentage error
    MaxPercent = 0;                                     %variable to store algorithm's maximum percentage error
    MinError_Num = 0;                                   %variable to store input number to achieve algorithm's minimum error
    MaxError_Num = 0;                                   %variable to store input number to achieve algorithm's maximum error
    MinPercent_Num = 0;                                 %variable to store input number to achieve algorithm's minimum percentage error
    MaxPercent_Num = 0;                                 %variable to store input number to achieve algorithm's maximum percentage error
    
    Actual = zeros(1, 2^Array);
    Approx = zeros(1, 2^Array);
    
    FileName = 'ReMCheckAlgo Result.txt';
    tic;
    for Multiplier = 0 : 2^Power - 1
        Count = Count + 1;
        Num = ((Multiplier * 2^Array) + 1) : ((Multiplier + 1) * 2^Array);
        for i = 1 : 2^Array
            Actual(i) = AlgoLogarithm(Num(i));
            Approx(i) = AlgoDeCaro4(Num(i));           %CHANGE ALGORITHM'S FUNCTION HERE!
        end
        if Count == 256
            Count = 0;
        end
        for i = 1 : 2^Array
            [MinError, MaxError, MinPercent, MaxPercent, MinError_Num, MaxError_Num, MinPercent_Num, MaxPercent_Num] = ErrorCheck(Actual(i), Approx(i), MinError, MaxError, MinPercent, MaxPercent, MinError_Num, MaxError_Num, MinPercent_Num, MaxPercent_Num, Num(i));
        end
    end
    File = fopen(FileName, 'a');
    fprintf(File, 'DeCaro4 (%d-bit) : Min Error       = %+.10f, Input     = %10u\r\n', Total, MinError, MinError_Num);         %CHANGE ALGORITHM'S NAME HERE!
    fprintf(File, '                         : Max Error       = %+.10f, Input     = %10u\r\n', MaxError, MaxError_Num);
    fprintf(File, '                         : Min Error(%%)    = %+.10f, Input     = %10u\r\n', MinPercent, MinPercent_Num);
    fprintf(File, '                         : Max Error(%%)    = %+.10f, Input     = %10u\r\n', MaxPercent, MaxPercent_Num);
    fprintf(File, '(%.2f)\r\n', toc);
    fprintf(File, '\r\n');
    fclose('all');
    toc;
    fprintf('\n\n');
end

function [MinError, MaxError, MinPercent, MaxPercent, MinErrorNum, MaxErrorNum, MinPercentNum, MaxPercentNum] = ErrorCheck(Result, Approximation, MinError, MaxError, MinPercent, MaxPercent, MinErrorNum, MaxErrorNum, MinPercentNum, MaxPercentNum, Num)
    Error = Result - Approximation;
    if Result == 0                                      %prevent positive and negative infinity error
        return;
    end
    if Error > MaxError                                 %check for maximum error
        MaxError = Error;
        MaxErrorNum = Num;
    end
    if Error < MinError                                 %check for maximum error
        MinError = Error;
        MinErrorNum = Num;
    end
    if 100 * Error / Result > MaxPercent                %check for maximum percentage error
        MaxPercent = 100 * Error / Result;
        MaxPercentNum = Num;
    end
    if 100 * Error / Result < MinPercent                %check for maximum percentage error
        MinPercent = 100 * Error / Result;
        MinPercentNum = Num;
    end
end