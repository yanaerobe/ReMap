function Result = AlgoRangeMapping_m020(Num)


    %---------------------------------------------------------------------%
    % User inputs
    %---------------------------------------------------------------------%
    
    nr_MSBs_m = 7;                                      %Number of most significant bits used for m. 
    nr_MSBs_const = 13;                                 %Number of most significant bits used for const.
    

    %---------------------------------------------------------------------%
    % Algorithm
    %---------------------------------------------------------------------%
    
    [k, m] = KeyValues(Num);                            %calculate position of leading one & mantissa

    [m, m_2MSBs] = rangeMapping(m);                     %Perform Range Mapping
  
    x = floor(m * 2^nr_MSBs_m) / 2^nr_MSBs_m;           %calculate mantissa
    m_2nd3rdMSBs = floor(m*2^3) - floor(m*2)*2^2;
    m_4th5thMSBs = floor(m*2^5) - floor(m*2^3)*2^2;
    
    % Computing constants (New 3-region error correction equations)
    if(m_2nd3rdMSBs == 0 && m_4th5thMSBs == 1)                                                                            % Region 3
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
    elseif(m_2nd3rdMSBs == 2 && m_4th5thMSBs ~= 3)                                                                        % Region 1
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
    elseif((m_2nd3rdMSBs == 2 && m_4th5thMSBs == 3) || m_2nd3rdMSBs == 3 || m_2nd3rdMSBs == 0 && m_4th5thMSBs == 0)       % Region 2
        if(m_2MSBs == 0)
            const =  floor(((2-log2(5)) + (log2(1+0.34375)-0.34375) + 0.5*0.003556577336598)*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const; 
        elseif(m_2MSBs == 0.25)
            const =  floor(((2-log2(4)) + (log2(1+0.34375)-0.34375) + 0.5*0.003556577336598)*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.5)
            const =  floor(((2-log2(3.5)) + (log2(1+0.34375)-0.34375) + 0.5*0.003556577336598)*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        elseif(m_2MSBs == 0.75)
            const =  floor(((2-log2(3)) + (log2(1+0.34375)-0.34375) + 0.5*0.003556577336598)*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
        else
            
            fprintf('ERROR! No constant is selected for 2nd region! \n');
            
        end
    
    else
        
        fprintf('ERROR! No constant is selected at all! \n');
        
    end

    % Determining inputs to adders(New 3-region error correction equations)
    if(m_2nd3rdMSBs == 2 && m_4th5thMSBs ~= 3)
        m_Corrected = m + 2^-3*x + const; 
    elseif((m_2nd3rdMSBs == 2 && m_4th5thMSBs == 3) || m_2nd3rdMSBs == 3 || m_2nd3rdMSBs == 0 && m_4th5thMSBs == 0)
        m_Corrected = m + const;
    elseif(m_2nd3rdMSBs == 0 && m_4th5thMSBs == 1)
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
