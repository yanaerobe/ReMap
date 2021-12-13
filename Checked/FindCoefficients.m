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
    0.3125, 0.34375, 0.375, 0.5, 0.5; 
	]; 

	m1 = (m2+1)./Gr-1; 
    
    file = 'FindCoefficients.txt'; 
    delete(file); 
    fid = fopen(file, 'a'); 
    
    for rgn = (1 : 4) %region 1
        if rgn == 1 
            for seg = (1 : 4) 
                poly = Fitting(rgn, seg); 
                fprintf(fid, '%f ', poly); 
                fprintf(fid, '\n'); 
                xi = m1(rgn, seg) : 0.00001 : m1(rgn, seg+1)-2^-16; 
                yi = polyval(poly, xi); 
                plot(xi, yi); 
                hold on; 
            end 
        else 
            for seg = (1 : 3) 
              poly = Fitting(rgn, seg); 
                fprintf(fid, '%f ', poly); 
                fprintf(fid, '\n'); 
                xi = m1(rgn, seg) : 0.00001 : m1(rgn, seg+1)-2^-16; 
                yi = polyval(poly, xi); 
                plot(xi, yi); 
                hold on; 
            end
        end 
    end 
    
    fclose('all'); 
    
    x = 0 : 0.001 : 1; 
    y = log2(1+x); 
    plot(x, y); 