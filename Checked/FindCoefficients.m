% another bug described in container/remap.md
% 1. modify Fitting.md into a function; 2. adopt Fitting(rgn) in FindCoefficients; 3. continue 16 bit simulation process and assess its performance. 

%for each rgnment, gm1 is the first point and fm1 the second. 

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
    
    fid = fopen('FindCoefficients.txt', 'a'); 

	m1 = (m2+1)./Gr-1; 
    for N = (1 : 4) 
        for M = (1 : 4) 
            gm1(N, M) = castrARM4(m1(N, M)); %#ok<SAGROW>
            fm1(N, M) = castrARM4(m1(N, M+1) - 2^-16); %#ok<SAGROW>
        end
    end
    for rgn = (1 : 1) %region 1
        for seg = (1 : 4) 
            pj = Fitting(rgn, seg); 
            fprintf(fid, '%f ', pj); 
            fprintf(fid, '\n'); 
            xi = m1(rgn, seg) : 0.00001 : m1(rgn, seg+1)-2^-16; 
            yi = polyval(pj, xi); 
            plot(xi, yi); 
            hold on; 
        end 
    end 
    for rgn = (2 : 4) %region 2 to region 4
        for seg = (1 : 3) 
            pj = Fitting(rgn, seg); 
            fprintf(fid, '%f ', pj); 
            fprintf(fid, '\n'); 
            xi = m1(rgn, seg) : 0.00001 : m1(rgn, seg+1)-2^-16; 
            yi = polyval(pj, xi); 
            plot(xi, yi); 
            hold on; 
        end 
    end 
    x = 0 : 0.001 : 1; 
    y = log2(1+x); 
    plot(x, y); 