function poly = Fitting(rgn, seg) 

    make; 

    point_num = 1000; %number of points to be fitted

    step = (m1(rgn,seg+1)-m1(rgn,seg))/point_num; 
    xi = (m1(rgn,seg) : step : m1(rgn,seg+1)-step); 
    yi = arrayfun(@castrARM4, xi); 
    
    poly = polyfit(xi, yi, 1); 

end