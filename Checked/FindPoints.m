make; 
m1 = (m2+1)./Gr-1; 
gm1 = reshape(arrayfun(@castrARM4, m1(:)), 4, 5); 

file = 'FindPoints.txt'; 
delete(file); 
fid = fopen(file, 'a'); 
    
for I = (1 : 4) 
	%disp(I); 
	%disp(['m1: ', num2str(m1(I,:))]); 
	%disp(['m2: ', num2str(m2(I,:))]); 
	%disp(['gm1: ', num2str(gm1(I,:))]); 
	%disp(['m1/m2: ', num2str(x_ratio(I,:))]); 
	%disp(['fm1/gm2: ', num2str(y_ratio(I,:))]); 
	fprintf (fid, 'Segment %d:\nm1: ', I); 
	fprintf (fid, '%f ', m1(I,:)); 
	fprintf (fid, '\nm2: '); 
	fprintf (fid, '%f ', m2(I,:)); 
	fprintf (fid, '\ngm1: '); 
	fprintf (fid, '%f ', gm1(I,:)); 
	fprintf (fid, '\n'); 
end 
fclose('all'); 