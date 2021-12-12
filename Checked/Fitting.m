function pj_fit = Fitting(rgn, seg) 

format long; 

Gr = [
    2^0+2^-2, 2^0+2^-2, 2^0+2^-2, 2^0+2^-2, 2^0+2^-2; 
    2^0, 2^0, 2^0, 2^0, 2^0; 
    2^0-2^-3, 2^0-2^-3, 2^0-2^-3, 2^0-2^-3, 2^0-2^-3; 
    2^0-2^-2, 2^0-2^-2, 2^0-2^-2, 2^0-2^-2, 2^0-2^-2; 
    ]; %1.25, 1, 0.875, 0.75

m2 = [
	0.25, 0.34375, 0.375, 0.53125, 0.5625; 
    0.25, 0.34375, 0.375, 0.5, 0.5; 
	0.3125, 0.34375, 0.375, 0.53125, 0.53125; 
    0.3125, 0.34375, 0.375, 0.5, 0.5; 
	]; 

    point_num = 1000; %number of points to be fitted

    m1 = (m2+1)./Gr-1; 
    step = (m1(rgn,seg+1)-m1(rgn,seg))/point_num; 
    xi = (m1(rgn,seg) : step : m1(rgn,seg+1)-step); 
    yi = arrayfun(@castrARM4, xi); 
    poly = polyfit(xi, yi, 1); 

    pj_fit = poly; 
end