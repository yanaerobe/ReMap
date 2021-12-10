function rslt = AlgoReMapping_16bit(num)
%ALGOREMAPPING opmitised method for range mapping
%   After figuring out coefficients by fitting, we apply them to the
%   remapping method. This function calculates one result each time. 

% nr_MSBs_m2 = 7; 
nr_MSBs_const = 16; %for 16-bit algo, we need a 16 bit constant

[k, m] = KeyValues(num); 
%segment 1
if (m >= 0 && m < 0.075) 
    

end