function rslt = CastrARM16(m)
%CastrARM16 forcibly included m1 = 1 into the orginal algo

makeremap; 

%region 1
if (node(1) <= m && m < node(2)) 
    m_r = coef(1, 1)*m + coef(2, 1); 
elseif (node(2) <= m && m < node(3)) 
    m_r = coef(1, 2)*m + coef(2, 2); 
elseif (node(3) <= m && m < node(4)) 
    m_r = coef(1, 3)*m + coef(2, 3); 
elseif (node(4) <= m && m < node(5)) 
    m_r = coef(1, 4)*m + coef(2, 4); 
elseif (node(5) <= m && m < node(6)) 
    m_r = coef(1, 5)*m + coef(2, 5); 
elseif (node(6) <= m && m < node(7)) 
    m_r = coef(1, 6)*m + coef(2, 6); 
elseif (node(7) <= m && m < node(8)) 
    m_r = coef(1, 7)*m + coef(2, 7); 
elseif (node(8) <= m && m < node(9)) 
    m_r = coef(1, 8)*m + coef(2, 8); 
elseif (node(9) <= m && m < node(10)) 
    m_r = coef(1, 9)*m + coef(2, 9); 
elseif (node(10) <= m && m < node(11)) 
    m_r = coef(1, 10)*m + coef(2, 10); 
elseif (node(11) <= m && m < node(12)) 
    m_r = coef(1, 11)*m + coef(2, 11); 
elseif (node(12) <= m && m < node(13)) 
    m_r = coef(1, 12)*m + coef(2, 12); 
elseif (node(13) <= m && m <= node(14)) 
    m_r = coef(1, 13)*m + coef(2, 13); 
end

rslt = m_r; 

end