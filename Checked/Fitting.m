function poly = Fitting(node1, node2) 

    makenode; 

    point_num = 1000; %number of points to be fitted

    head = node(node1); 
    step = (node(node2) - node(node1))/(point_num+1); 
    tail = node(node2) - step; 

    xi = (head : step : tail); 
    yi = arrayfun(@castrARM4, xi); 

    poly = polyfit(xi, yi, 1); 
    %plot(xi, yi); 
    %hold on; 
    
    yj = polyval(poly, xi); 
    plot(xi, yj, 'b:'); 
    hold on; 

end