file = 'FindCoefficients.txt'; 
delete(file); 
fid = fopen(file, 'a'); 
    
for i = 1 : 41 
    poly = Fitting(i); 
    fprintf(fid, '%.7f ', poly); 
    fprintf(fid, '\n'); 
end 

fclose('all'); 

%x = 0 : 0.001 : 1; 
%y = log2(1+x); 
%plot(x, y); 