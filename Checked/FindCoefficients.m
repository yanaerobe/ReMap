% another bug described in container/remap.md
% 1. modify Fitting.md into a function; 2. adopt Fitting(rgn) in FindCoefficients; 3. continue 16 bit simulation process and assess its performance. 

%for each segment, gm1 is the first point and fm1 the second. 
    
file = 'FindCoefficients.txt'; 
delete(file); 
fid = fopen(file, 'a'); 

poly1 = Fitting(1, 2); 
fprintf(fid, '%.7f %.7f\n', floor(poly1(1)*2^6)/2^6, poly1(2)); 

poly2 = Fitting(2, 16); 
fprintf(fid, '%.7f %.7f\n', floor(poly2(1)*2^6)/2^6, poly2(2)); 

poly3 = Fitting(16, 17); 
fprintf(fid, '%.7f %.7f\n', floor(poly3(1)*2^6)/2^6, poly3(2)); 

poly4 = Fitting(17, 30); 
fprintf(fid, '%.7f %.7f\n', floor(poly4(1)*2^6)/2^6, poly4(2)); 

poly5 = Fitting(30, 36); 
fprintf(fid, '%.7f %.7f\n', floor(poly5(1)*2^6)/2^6, poly5(2)); 

poly6 = Fitting(36, 42); 
fprintf(fid, '%.7f %.7f\n', floor(poly6(1)*2^6)/2^6, poly6(2)); 

fclose('all'); 

%x = 0 : 0.001 : 1; 
%y = log2(1+x); 
%plot(x, y); 