%To add f1 segment to this algo: 
%1. calculate m7MSB
%2. 
%3. calculate the error
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
        for M1 = (1 : 5) 
            gm1(N1,M1) = castrARM4(m1(N1,M1)); %#ok<SAGROW>
        end
    end
    %file = 'experiment.txt'; 
    %delete(file); 
    for N2 = (1 : 1) %seg 1
        disp(N2); 
        for M2 = (2 : 5) %neglect f1 part 
            xi = m1(N2, M2-1) : 0.00001 : m1(N2, M2); 
            m1i = [m1(N2, M2-1); m1(N2, M2)]; 
            gm1i = [gm1(N2, M2-1); gm1(N2, M2)-0.00001]; 
            pi = polyfit(m1i, gm1i, 1); 
            disp(pi); 
            yi = polyval(pi, xi); 
            plot(xi, yi); 
            hold on; 
        end 
    end 
    for N2 = (2 : 4) %seg 2 to seg 4
        disp(N2); 
        for M2 = (2 : 4) %neglect f1 part and repeated f4
            xi = m1(N2, M2-1) : 0.00001 : m1(N2, M2); 
            m1i = [m1(N2, M2-1); m1(N2, M2)]; 
            gm1i = [gm1(N2, M2-1); gm1(N2, M2)-0.00001]; 
            pi = polyfit(m1i, gm1i, 1); 
            disp(pi); 
            yi = polyval(pi, xi); 
            plot(xi, yi); 
            hold on; 
        end 
    end 
    x = 0 : 0.001 : 1; 
    y = log2(1+x); 
    %plot(x, y); 
%    for I = (1 : 1) 
%        disp(I); 
%        disp(['m1: ', num2str(m1(I,:))]); 
%        disp(['m2: ', num2str(m2(I,:))]); 
%        disp(['gm1: ', num2str(gm1(I,:))]); 
%        %fclose('all'); 
%    end 