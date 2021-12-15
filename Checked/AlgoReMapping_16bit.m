function rslt = AlgoReMapping_16bit(num)
%ALGOREMAPPING opmitised method for range mapping
%   After figuring out coefficients by fitting, we apply them to the
%   remapping method. This function calculates one result each time. 

%fid = fopen('FindCoefficients.txt', 'r'); 
%coef = fscanf(fid, '%f', [2, 13]); 
coef = [
    1.405174, 1.25, 1.25,1.25, 1.124139, 1, 1, 0.977539, 0.875, 0.875, 0.837891, 0.75, 0.75; 
    -0.000447,0.011719,0.013184,0.010254,0.040297,0.083496,0.084961,0.095827,0.150879,0.152832,0.178346,0.248535,0.25
    ]; 

[k, m] = KeyValues(num); 

if (0 <= m && m < 0.075) 
    m_r = coef(1, 1)*m + coef(2, 1); 
elseif (0.075 <= m && m < 0.1) 
    m_r = coef(1, 2)*m + coef(2, 2); 
elseif (0.1 <= m && m < 0.225) 
    m_r = coef(1, 3)*m + coef(2, 3); 
elseif (0.225 <= m && m < 0.25) 
    m_r = coef(1, 4)*m + coef(2, 4); 
elseif (0.25 <= m && m < 0.34375) 
    m_r = coef(1, 5)*m + coef(2, 5); 
elseif (0.34375 <= m && m < 0.375) 
    m_r = coef(1, 6)*m + coef(2, 6); 
elseif (0.375 <= m && m < 0.5) 
    m_r = coef(1, 7)*m + coef(2, 7); 
elseif (0.5 <= m && m < 15/28) 
    m_r = coef(1, 8)*m + coef(2, 8); 
elseif (15/28 <= m && m < 4/7) 
    m_r = coef(1, 9)*m + coef(2, 9); 
elseif (4/7 <= m && m < 0.75) 
    m_r = coef(1, 10)*m + coef(2, 10); 
elseif (0.75 <= m && m < 19/24) 
    m_r = coef(1, 11)*m + coef(2, 11); 
elseif (19/24 <= m && m < 5/6) 
    m_r = coef(1, 12)*m + coef(2, 12); 
elseif (5/6 <= m && m < 1) 
    m_r = coef(1, 13)*m + coef(2, 13); 
end

%fclose('all');

m_16 = floor(m_r * 2^16) / 2^16; 
rslt = m_16 + k; 

end