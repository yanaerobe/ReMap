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
            if (N ~= 4 && (M ~= 4 || M ~= 5) )
                gm1(N,M) = CastrARM16(m1(N,M));  
            end
        end
    end
    file = 'FindPoints2.txt'; 
    delete(file); 
    for I = (1 : 4) 
        %disp(I); 
        %disp(['m1: ', num2str(m1(I,:))]); 
        %disp(['m2: ', num2str(m2(I,:))]); 
        %disp(['gm1: ', num2str(gm1(I,:))]); 
        %disp(['m1/m2: ', num2str(x_ratio(I,:))]); 
        %disp(['fm1/gm2: ', num2str(y_ratio(I,:))]); 
        fid = fopen(file, 'a'); 
        fprintf (fid, 'Segment %f :\nm1: ', I); 
        fprintf (fid, '%f ', m1(I,:) ); 
        fprintf (fid, '\nm2: '); 
        fprintf (fid, '%f ', m2(I,:) ); 
        fprintf (fid, '\ngm1: '); 
        fprintf (fid, '%f ', gm1(I,:) ); 
        fprintf (fid, '\n'); 
        fclose('all'); 
    end 