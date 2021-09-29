Gr = [2^0+2^-2, 2^0, 2^0-2^-3, 2^0-2^-2]; %1.25, 1, 0.875, 0.75
m2 = [
	0.25, 0.34375, 0.53125, 0.5625; 
    0, 0.25, 0.34375, 0.5; 
	0, 0.3125, 0.34375, 0.53125; 
    0, 0.3125, 0.34375, 0.5
	]; 

for N = (1 : 1 : 4) 
	m1 = (m2(N,:)+1)/Gr(N) -1; 
    disp('m1'); 
    disp(m1); 
    m_2MSBs = floor(m1*2^2) /  2^2;
    disp('m_2MSBs'); 
	disp(m_2MSBs); 

if(m_2MSBs == 0)
    m1 = (2^2 + 2^0) * (1+m1) / 2^2 - 1; % <1>
elseif(m_2MSBs == 0.25)
    m1 = (2^2) * (1+m1) / 2^2 - 1; % <1>
elseif(m_2MSBs == 0.5)
    m1 = (2^2 - 2^-1) * (1+m1) / 2^2 - 1; % <1>
elseif(m_2MSBs == 0.75)
    m1 = (2^2 - 2^0) * (1+m1) / 2^2 - 1; % <1>
else
    
    fprintf('ERROR! Invalid range of approximation is entered! \n');

end
    disp('m1'); 
    disp(m1); 
end