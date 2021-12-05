function result = castrARM4(m1)
%castrated AlgoRangeMapping4. 
%input m1 instead of Num
%do we need to castrate ifs? LET'S TRY

nr_MSBs_m =7;
nr_MSBs_const = 11;

[m1, m_2MSBs] = RMrangeMapping(m1);                     %Perform Range Mapping
x = floor(m1 * 2^nr_MSBs_m) / 2^nr_MSBs_m;           %calculate mantissa

% Computing constants (4-region error correction equations)
if(m1 >= 0.25 && m1 < 0.34375)            % Region 1
    if(m_2MSBs == 0)
        const =  floor(((2-log2(5)) + (log2(1+0.25)-0.25*1.125))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.25)
        const =  floor(((2-log2(4)) + (log2(1+0.25)-0.25*1.125))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.5)
        const =  floor(((2-log2(3.5)) + (log2(1+0.25)-0.25*1.125))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.75 || m_2MSBs == 1)
        const =  floor(((2-log2(3)) + (log2(1+0.25)-0.25*1.125))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    else
        
        fprintf('ERROR! No constant is selected for 1st region! \n');
        
    end
elseif(m1 >= 0.34375 && m1 < 0.375)       % Region 2
    if(m_2MSBs == 0)
        const =  floor(((2-log2(5)) + (log2(1+0.34375)-0.34375 + 0.5*(0.001910584567448)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.25)
        const =  floor(((2-log2(4)) + (log2(1+0.34375)-0.34375 + 0.5*(0.001910584567448)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.5)
        const =  floor(((2-log2(3.5)) + (log2(1+0.34375)-0.34375 + 0.5*(0.001910584567448)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.75 || m_2MSBs == 1)
        const =  floor(((2-log2(3)) + (log2(1+0.34375)-0.34375 + 0.5*(0.001910584567448)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    else
        
        fprintf('ERROR! No constant is selected for 2nd region! \n');
        
    end
    
elseif(m1 >= 0.375 && m1 < 0.53125)       % Region 3
    if(m_2MSBs == 0)
        const =  floor(((2-log2(5)) + (log2(1+0.375)-0.375 + 0.5*(0.001598675788696 + -0.001011047534533 + 2^-nr_MSBs_const)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.25)
        const =  floor(((2-log2(4)) + (log2(1+0.375)-0.375 + 0.5*(0.001598675788696 + -0.001011047534533 + 2^-nr_MSBs_const)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.5)
        const =  floor(((2-log2(3.5)) + (log2(1+0.375)-0.375 + 0.5*(0.001598675788696 + -0.001011047534533 + 2^-nr_MSBs_const)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.75 || m_2MSBs == 1)
        const =  floor(((2-log2(3)) + (log2(1+0.375)-0.375 + 0.5*(0.001598675788696 + -0.001011047534533 + 2^-nr_MSBs_const)))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    else
        
        fprintf('ERROR! No constant is selected for 2nd region! \n');
        
    end
    
elseif(m1 >= 0.53125 && m1 < 0.5625)      % Region 4
    if(m_2MSBs == 0)
        const =  floor(((2-log2(5)) + (log2(1+0.53125)-0.53125) + 0.5*(-0.002101314675052))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.25)
        const =  floor(((2-log2(4)) + (log2(1+0.53125)-0.53125) + 0.5*(-0.002101314675052))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.5)
        const =  floor(((2-log2(3.5)) + (log2(1+0.53125)-0.53125) + 0.5*(-0.002101314675052))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    elseif(m_2MSBs == 0.75 || m_2MSBs == 1)
        const =  floor(((2-log2(3)) + (log2(1+0.53125)-0.53125) + 0.5*(-0.002101314675052))*2^nr_MSBs_const + 0.5) / 2^nr_MSBs_const;
    else
        
        fprintf('ERROR! No constant is selected for 3rd region! \n');
        
    end
    
else
    
    fprintf('ERROR! No constant is selected at all! \n');
    
end

% Determining inputs to adders(New 3-region error correction equations)
if(m1 >= 0.25 && m1 < 0.34375)
    m_Corrected = m1 + 2^-3*x + const;
elseif(m1 >= 0.34375 && m1 <0.5625)
    m_Corrected = m1 + const;
else
    
    fprintf('ERROR! Invalid range of approximation is entered! \n');
    
end


if(m_Corrected > 1 || m_Corrected <0)
    
    fprintf('WARNING! The corrected Mitchell fraction is greater than 1 or less than 0 which will leads to higher complexity! \n');
    
end

result = floor(m_Corrected * 2^27) / 2^27;     %limit mantissa to 27 bits
end