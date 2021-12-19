% another bug described in container/remap.md
% 1. modify Fitting.md into a function; 2. adopt Fitting(rgn) in FindCoefficients; 3. continue 16 bit simulation process and assess its performance. 

%for each segment, gm1 is the first point and fm1 the second. 

make; 
    
file = 'FindCoefficients.txt'; 
delete(file); 
fid = fopen(file, 'a'); 
    
for rgn = (1 : 4) %region 1
	if rgn == 1 
        for seg = (1 : 5) 
            poly = Fitting(rgn, seg); 
            fprintf(fid, '%.7f ', poly); 
            fprintf(fid, '\n'); 
        end 
    else 
        for seg = (1 : 4) 
          poly = Fitting(rgn, seg); 
            fprintf(fid, '%.7f ', poly); 
            fprintf(fid, '\n'); 
        end
	end 
end 

fclose('all'); 

%x = 0 : 0.001 : 1; 
%y = log2(1+x); 
%plot(x, y); 