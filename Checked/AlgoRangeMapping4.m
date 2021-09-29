%Num: input
%k: k
%m: m1->m2
%m_2MSBs: two MSBs of m1
%x: 7 MSBs of m2, for error correction
%const: fi+log2(Gr)

function Result = AlgoRangeMapping4(Num)

    %---------------------------------------------------------------------%
    % User inputs
    %---------------------------------------------------------------------%
    nr_MSBs_m =7;                                       %Number of most significant bits used for m. 
    nr_MSBs_const = 11;                                 %Number of most significant bits used for const.
    
    %---------------------------------------------------------------------%
    % Algorithm
    %---------------------------------------------------------------------%
    [k, m] = KeyValues(Num);                            %calculate position of leading one & mantissa
    [m, m_2MSBs] = rangeMapping(m);                     %Perform Range Mapping
    x = floor(m * 2^nr_MSBs_m) / 2^nr_MSBs_m;           %calculate mantissa
    
    % Computing constants (4-region error correction equations)
    if(m >= 0.25 && m < 0.34375)            % Region 1
        if(m_2MSBs == 0)
            const =  floor(((2-log2(5)) + (log2(1+0.25)-0.25*1.125))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const; 
        elseif(m_2MSBs == 0.25)
            const =  floor(((2-log2(4)) + (log2(1+0.25)-0.25*1.125))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.5)
            const =  floor(((2-log2(3.5)) + (log2(1+0.25)-0.25*1.125))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.75)
            const =  floor(((2-log2(3)) + (log2(1+0.25)-0.25*1.125))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        else
            
            fprintf('ERROR! No constant is selected for 1st region! \n');
            
        end
    elseif(m >= 0.34375 && m < 0.375)       % Region 2
        if(m_2MSBs == 0)
            const =  floor(((2-log2(5)) + (log2(1+0.34375)-0.34375 + 0.5*(0.001910584567448)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const; 
        elseif(m_2MSBs == 0.25)
            const =  floor(((2-log2(4)) + (log2(1+0.34375)-0.34375 + 0.5*(0.001910584567448)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.5)
            const =  floor(((2-log2(3.5)) + (log2(1+0.34375)-0.34375 + 0.5*(0.001910584567448)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.75)
            const =  floor(((2-log2(3)) + (log2(1+0.34375)-0.34375 + 0.5*(0.001910584567448)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        else
            
            fprintf('ERROR! No constant is selected for 2nd region! \n');
            
        end
        
    elseif(m >= 0.375 && m < 0.53125)       % Region 3
        if(m_2MSBs == 0)
            const =  floor(((2-log2(5)) + (log2(1+0.375)-0.375 + 0.5*(0.001598675788696 + -0.001011047534533 + 2^-nr_MSBs_const)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const; 
        elseif(m_2MSBs == 0.25)
            const =  floor(((2-log2(4)) + (log2(1+0.375)-0.375 + 0.5*(0.001598675788696 + -0.001011047534533 + 2^-nr_MSBs_const)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.5)
            const =  floor(((2-log2(3.5)) + (log2(1+0.375)-0.375 + 0.5*(0.001598675788696 + -0.001011047534533 + 2^-nr_MSBs_const)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.75)
            const =  floor(((2-log2(3)) + (log2(1+0.375)-0.375 + 0.5*(0.001598675788696 + -0.001011047534533 + 2^-nr_MSBs_const)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        else
            
            fprintf('ERROR! No constant is selected for 2nd region! \n');
            
        end
        
    elseif(m >= 0.53125 && m < 0.5625)      % Region 4
        if(m_2MSBs == 0)
            const =  floor(((2-log2(5)) + (log2(1+0.53125)-0.53125) + 0.5*(-0.002101314675052))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const; 
        elseif(m_2MSBs == 0.25)
            const =  floor(((2-log2(4)) + (log2(1+0.53125)-0.53125) + 0.5*(-0.002101314675052))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.5)
            const =  floor(((2-log2(3.5)) + (log2(1+0.53125)-0.53125) + 0.5*(-0.002101314675052))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.75)
            const =  floor(((2-log2(3)) + (log2(1+0.53125)-0.53125) + 0.5*(-0.002101314675052))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        else
            
            fprintf('ERROR! No constant is selected for 3rd region! \n');
            
        end
    
    else
        
        fprintf('ERROR! No constant is selected at all! \n');
        
    end
            
    % Determining inputs to adders(New 3-region error correction equations)
    if(m >= 0.25 && m < 0.34375)
        m_Corrected = m + 2^-3*x + const; 
    elseif(m >= 0.34375 && m <0.5625)
        m_Corrected = m + const;
    else
        
        fprintf('ERROR! Invalid range of approximation is entered! \n');
        
    end
    
    
    if(m_Corrected >= 1 || m_Corrected <0)
        
        fprintf('WARNING! The corrected Mitchell fraction is greater than 1 or less than 0 which will leads to higher complexity! \n');
        
    end
    
    m_Truncated = floor(m_Corrected * 2^27) / 2^27;     %limit mantissa to 27 bits
    Result = k + m_Truncated;                           %result of Range Mapping (3-Region) approximation
end
