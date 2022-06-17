function rslt = AlgoReMap(num)
%ALGOREMAP opmitized method for range mapping
%   After figuring out coefficients by fitting, we apply them to the
%   remap method. This function calculates one result each time. 

makeremap; 

%fid = fopen('FindCoefficients.txt', 'r'); 
%coef = fscanf(fid, '%f', [2, 13]); 

[k, m] = KeyValues(num); 

n = find(m < node, 1)-1;

m_r = coef(1, n)*m + coef(2, n); 

%fclose('all');

m_16 = floor(m_r * 2^27) / 2^27; 
rslt = m_16 + k; 

end