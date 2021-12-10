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
    for N = (1 : 4) 
        for M = (1 : 5) 
            gm1(N,M) = castrARM4(m1(N,M));  
        end
    end
    file = 'FindPoints.txt'; 
    delete(file); 
    for I = (1 : 4) 
        %disp(I); 
        %disp(['m1: ', num2str(m1(I,:))]); 
        %disp(['m2: ', num2str(m2(I,:))]); 
        %disp(['gm1: ', num2str(gm1(I,:))]); 
        %disp(['m1/m2: ', num2str(x_ratio(I,:))]); 
        %disp(['fm1/gm2: ', num2str(y_ratio(I,:))]); 
        fid = fopen(file, 'a'); 
        fprintf (fid, 'Segment %d :\n', I); 
        fprintf (fid, 'm1: %s\n', num2str(m1(I,:)) ); 
        fprintf (fid, 'm2: %s\n', num2str(m2(I,:)) ); 
        fprintf (fid, 'gm1: %s\n', num2str(gm1(I,:)) ); 
        fprintf (fid, '\n'); 
        fclose('all'); 
    end 