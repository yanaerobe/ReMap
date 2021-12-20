function poly = Fitting(n) 

    makenode; 

    point_num = 1000; %number of points to be fitted

    head = node(n); 
    step = (node(n+1) - node(n))/(point_num+1); 
    tail = node(n+1) - step; 

    xi = (head : step : tail); 
    yi = arrayfun(@castrARM4, xi); 

    poly = polyfit(xi, yi, 1); 
    
    %plot(xi, yi, 'r--'); 
    %hold on; 
    
    %yj = polyval(poly, xi); 
    %plot(xi, yj, 'b:'); 
    %hold on; 

end