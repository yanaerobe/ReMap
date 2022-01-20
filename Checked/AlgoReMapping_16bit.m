function rslt = AlgoReMapping_16bit(num)
%ALGOREMAPPING opmitized method for range mapping
%   After figuring out coefficients by fitting, we apply them to the
%   remapping method. This function calculates one result each time. 

fid = fopen('FindCoefficients.txt', 'r'); 
coef = fscanf(fid, '%f', [2, 17]); 

[k, m] = KeyValues(num); 

%region 1
if (0 <= m && m < 0.00625) %0 + 2^-7/Gr(1, 1)
    m_r = coef(1, 1)*m + coef(2, 1); 
elseif (0.00625 <= m && m < 0.075) 
    m_r = coef(1, 2)*m + coef(2, 2); 
elseif (0.075 <= m && m < 0.1) 
    m_r = coef(1, 3)*m + coef(2, 3); 
elseif (0.1 <= m && m < 0.225) 
    m_r = coef(1, 4)*m + coef(2, 4); 
elseif (0.225 <= m && m < 0.25) 
    m_r = coef(1, 5)*m + coef(2, 5); 
%region 2
elseif (0.25 <= m && m < 0.2578125) %0.25 + 2^-7/Gr(2, 1)
    m_r = coef(1, 6)*m + coef(2, 6); 
elseif (0.2578125 <= m && m < 0.34375) 
    m_r = coef(1, 7)*m + coef(2, 7); 
elseif (0.34375 <= m && m < 0.375) 
    m_r = coef(1, 8)*m + coef(2, 8); 
elseif (0.375 <= m && m < 0.5) 
    m_r = coef(1, 9)*m + coef(2, 9); 
%region 3
elseif (0.5 <= m && m < 0.508928571428571) %0.5 + 2^-7/Gr(3, 1) = 0.5 + 2^-4/7
    m_r = coef(1, 10)*m + coef(2, 10); 
elseif (0.508928571428571 <= m && m < 15/28) 
    m_r = coef(1, 11)*m + coef(2, 11); 
elseif (15/28 <= m && m < 4/7) 
    m_r = coef(1, 12)*m + coef(2, 12); 
elseif (4/7 <= m && m < 0.75) 
    m_r = coef(1, 13)*m + coef(2, 13); 
%region 4
elseif (0.75 <= m && m < 0.760416666666667) %0.75 + 2^-7/Gr(4, 1) = 0.75 + 2^-5/3
    m_r = coef(1, 14)*m + coef(2, 14); 
elseif (0.760416666666667 <= m && m < 19/24) 
    m_r = coef(1, 15)*m + coef(2, 15); 
elseif (19/24 <= m && m < 5/6) 
    m_r = coef(1, 16)*m + coef(2, 16); 
elseif (5/6 <= m && m < 1) 
    m_r = coef(1, 17)*m + coef(2, 17); 
end

fclose('all');

m_16 = floor(m_r * 2^27) / 2^27; 
rslt = m_16 + k; 

end