function rslt = experiment(m)

makeremap; 

%if find(node == m) 
    %n = find(m < node, 1); 
%else
    n = find(m < node, 1)-1;
%end

disp(n); 

m_r = coef(1, n)*m + coef(2, n); 

m_16 = floor(m_r * 2^27) / 2^27; 
rslt = m_16; 

end