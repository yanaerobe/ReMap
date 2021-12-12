function rslt = CastrARM16(m)
%CastrARM16 forcibly included m1 = 1 into the orginal algo

format long; 

%nr_MSBs_m2 = 7; 
%nr_MSBs_const = 16; %for 16-bit algo, we need a 16 bit constant

fid = fopen('FindCoefficients.txt', 'r'); 
coef = fscanf(fid, '%f', [2, 13]); 

if (0 <= m && m < 0.075) 
    m_r = coef(1, 1)*m + coef(2, 1); 
elseif(0.075 <= m && m < 0.1) 
    m_r = coef(1, 2)*m + coef(2, 2); 
elseif(0.1 <= m && m < 0.225) 
    m_r = coef(1, 3)*m + coef(2, 3); 
elseif(0.225 <= m && m < 0.25) 
    m_r = coef(1, 4)*m + coef(2, 4); 
elseif(0.25 <= m && m < 0.34375) 
    m_r = coef(1, 5)*m + coef(2, 5); 
elseif(0.34375 <= m && m < 0.375) 
    m_r = coef(1, 6)*m + coef(2, 6); 
elseif(0.375 <= m && m < 0.5) 
    m_r = coef(1, 7)*m + coef(2, 7); 
elseif(0.5 <= m && m < 15/28) 
    m_r = coef(1, 8)*m + coef(2, 8); 
elseif(15/28 <= m && m < 4/7) 
    m_r = coef(1, 9)*m + coef(2, 9); 
elseif(4/7 <= m && m < 0.75) 
    m_r = coef(1, 10)*m + coef(2, 10); 
elseif(0.75 <= m && m < 19/24) 
    m_r = coef(1, 11)*m + coef(2, 11); 
elseif(19/24 <= m && m < 5/6) 
    m_r = coef(1, 12)*m + coef(2, 12); 
elseif(5/6 <= m && m <= 1) 
    m_r = coef(1, 13)*m + coef(2, 13); 
end

fclose('all');

rslt = m_r; 

end