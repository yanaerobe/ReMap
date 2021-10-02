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
    0.25, 0.25, 0.34375, 0.5; 
	0.3125, 0.3125, 0.34375, 0.53125; 
    0.3125, 0.3125, 0.34375, 0.5; %这个0.5有问题，为什么？
	]; 

for N = (1 : 1 : 4) 
	m1 = (m2(N,:)+1)/Gr(N) -1; 
    fm1 = log2(1+m1);
    for M = (1 : 1 : 4) 
        gm1(M) = castrARM4(m1(M)); %可能不能用m1，这算出来好像没啥用啊，还是说gm1不对？
    end
    x_ratio = m1./m2(N,:); 
    y_ratio = fm1./gm1; 
    disp(N); 
    disp(['m1: ', num2str(m1)]); 
    disp(['fm1: ', num2str(fm1)]); 
	disp(['gm1: ', num2str(gm1)]); 
    disp(['m1/m2: ', num2str(x_ratio)]); 
    disp(['fm1/gm2: ', num2str(y_ratio)]); 
end