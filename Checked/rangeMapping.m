%-------------------------------------------------------------------------%
% Assumptions:
%   (1) 
% Remarks:
%   <1> We arbitary choose to map the initial range of Mitchell fraction to
%   the 2nd next Mitchell Interval from the current one.
%-------------------------------------------------------------------------%
function [m2, m_2MSBs] =  rangeMapping(m)

m_2MSBs = floor(m*2^2) /  2^2;

if(m_2MSBs == 0)
    m2 = (2^2 + 2^0) * (1+m) / 2^2 - 1; % <1>
elseif(m_2MSBs == 0.25)
    m2 = (2^2) * (1+m) / 2^2 - 1; % <1>
elseif(m_2MSBs == 0.5)
    m2 = (2^2 - 2^-1) * (1+m) / 2^2 - 1; % <1>
elseif(m_2MSBs == 0.75)
    m2 = (2^2 - 2^0) * (1+m) / 2^2 - 1; % <1>
else
    
    fprintf('ERROR! Invalid range of approximation is entered! \n');

end


if(m2<0 || m2>=1)
    
    fprintf('ERROR! Invalid focus range is mapped! \n');
    
end


end