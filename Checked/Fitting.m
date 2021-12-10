%BUG:
%the subtracting g(m1) is not the real gm1(m1), the real one should have a
%value of g(m1-o)

%alright, it seems to be the only bug. 
%debug: 1.try simpler way: merely adjust the second fitted points to be
%that of (m1-o, g(m1-o)) and check the result using this experiment;
%2.program a whole new set of RMrangeMapping and castrARM so that they
%can be practically used as functions for finding coeffients. 

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
    0.3125, 0.34375, 0.375, 0.5, 0.5; %forcibly included m1 = 1 into the orginal algo
	]; 

	C = 2^-32; 
    m1 = (m2+1)./Gr-1; 
    for N = (1 : 999) 
        xi(N) = m1(1,1) + N*(m1(1,2)-m1(1,1))/1000; 
        yi(N) = castrARM4(xi(N)); 
        plot (xi(N), yi(N), 'r.'); 
        hold on; 
    end
    pj = polyfit(xi, yi, 1); 
    xj = (m1(1,1) : 0.00001 : 999*(m1(1,2)-m1(1,1))/1000);
    yj = polyval(pj, xj); 
    plot(xj, yj, 'b'); 
    disp(pj); 