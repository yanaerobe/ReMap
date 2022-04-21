function poly = Fitting(num1, num2) 

    makenode; 

    point_num = 1000; %number of points to be fitted

    head = num1; 
    step = (num2 - num1)/(point_num+1); 
    tail = num2 - step; 

    xi = (head : step : tail); 
    yi = arrayfun(@castrARM4, xi); 

    poly = polyfit(xi, yi, 1); 
    %plot(xi, yi); 
    %hold on; 
    
    %yj = polyval(poly, xi); 
    %plot(xi, yj, 'b:'); 
    %hold on; 

end