% another bug described in container/remap.md
% 1. modify Fitting.md into a function; 2. adopt Fitting(rgn) in FindCoefficients; 3. continue 16 bit simulation process and assess its performance. 

%for each segment, gm1 is the first point and fm1 the second. 
    
file = 'FindCoefficients.txt'; 
delete(file); 
fid = fopen(file, 'a'); 

poly1 = Fitting(1, 2); 
fprintf(fid, '%.7f ', poly1); 
fprintf(fid, '\n'); 

poly2 = Fitting(2, 16); 
fprintf(fid, '%.7f ', poly2); 
fprintf(fid, '\n'); 

poly3 = Fitting(16, 17); 
fprintf(fid, '%.7f ', poly3); 
fprintf(fid, '\n'); 

poly4 = Fitting(17, 30); 
fprintf(fid, '%.7f ', poly4); 
fprintf(fid, '\n'); 

poly5 = Fitting(30, 36); 
fprintf(fid, '%.7f ', poly5); 
fprintf(fid, '\n'); 

poly6 = Fitting(36, 42); 
fprintf(fid, '%.7f ', poly6); 
fprintf(fid, '\n'); 

fclose('all'); 

x = 0 : 0.001 : 1; 
y = log2(1+x); 
plot(x, y); 