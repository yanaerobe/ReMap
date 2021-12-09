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

	m1 = (m2+1)./Gr-1; 
    for N1 = (1 : 4) 
        for M1 = (1 : 4) 
            gm1(N1,M1) = castrARM4(m1(N1,M1)); %#ok<SAGROW>
            fm1(N1,M1) = castrARM4(m1(N1,M1+1)-2^-16); %#ok<SAGROW>
        end
    end
    for N2 = (1 : 1) %seg 1
        disp(N2); 
        for M2 = (1 : 4) 
            m1i = [m1(N2, M2); m1(N2, M2+1)-2^-16]; 
            gm1i = [gm1(N2, M2); fm1(N2, M2)]; 
            pj = polyfit(m1i, gm1i, 1); 
            disp(pj); 
            xi = m1(N2, M2) : 0.00001 : m1(N2, M2+1)-2^-16; 
            yi = polyval(pj, xi); 
            plot(xi, yi); 
            hold on; 
        end 
    end 
    for N2 = (2 : 4) %seg 2 to seg 4
        disp(N2); 
        for M2 = (1 : 3) 
            m1i = [m1(N2, M2); m1(N2, M2+1)-2^-16]; 
            gm1i = [gm1(N2, M2); fm1(N2, M2)]; 
            pj = polyfit(m1i, gm1i, 1); 
            disp(pj); 
            xi = m1(N2, M2) : 0.00001 : m1(N2, M2+1)-2^-16; 
            yi = polyval(pj, xi); 
            plot(xi, yi); 
            hold on; 
        end 
    end 
    x = 0 : 0.001 : 1; 
    y = log2(1+x); 
    %plot(x, y); 