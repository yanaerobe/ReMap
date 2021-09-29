%write m1, fm1, m2 and gm2 to a txt
%do: 
%   calculate m1/m2, fm1/gm2
%or: 
%   fit m1 and fm1 to 4 lines
%   calculate domain and range ratios

function mappingback 

%FileName = 'MappingBack.txt'; 
Gr = [2^0+2^-2, 2^0, 2^0-2^-3, 2^0-2^-2]; %1.25, 1, 0.875, 0.75
m2 = [
	0.25, 0.34375, 0.53125, 0.5625; 
    0, 0.25, 0.34375, 0.5; 
	0, 0.3125, 0.34375, 0.53125; 
    0, 0.3125, 0.34375, 0.5
	]; 

for N = (1 : 1 : 1) 
	m1 = (m2(N,:)+1)/Gr(N) -1; 
    fm1 = log2(1+m1);
    for M = (1 :1 :4) 
        gm1(M) = castrARM4(m1(M)); 
    end
    x_ratio = m1/m2; 
    y_ratio = fm1/gm1; 
    disp(['m1: ', num2str(m1)]); 
    disp(['fm1: ', num2str(fm1)]); 
	disp(['gm1: ', num2str(gm1)]); 
    disp(['ratios of m1/m2: ', num2str(x_ratio)]); %快了，这里是矩阵相除有问题
    disp(['ratios of fm1/gm2: ', num2str(y_ratio)]); 
end