function poly = Fitting(rgn, seg) 

    make; 

    point_num = 1000; %number of points to be fitted

    if seg == 1 %subsegment
        head = m1(rgn, 1); 
        tail = m1(rgn, 1) + 2^-7./Gr(rgn, 1); 
        step = (tail - head)/point_num; 
    elseif seg == 2 %subtract the subsegment
        head = m1(rgn, seg-1) + 2^-7./Gr(rgn, seg-1); 
        step = (m1(rgn,seg) - head)/point_num; 
        tail = m1(rgn,seg) - step; 
    else 
        head = m1(rgn, seg-1); 
        step = (m1(rgn,seg) - head)/point_num; 
        tail = m1(rgn,seg) - step; 
    end

    xi = (head : step : tail - step); 
    yi = arrayfun(@castrARM4, xi); 

    poly = polyfit(xi, yi, 1); 
    
    yj = polyval(poly, xi); 
    
    plot(xi, yj); 
    hold on; 

end