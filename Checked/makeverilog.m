makeremap; 

% print node data
file1 = '../design_files/node.verilog'; 
fid1 = fopen(file1, 'a'); 
fprintf(fid1, '%.7X\n', floor(node.*2^27)); 

% print intercept data
file2 = '../design_files/intcpt.verilog'; 
fid2 = fopen(file2, 'a'); 
fprintf(fid2, '%.7X\n', floor(coef(2,:).*2^27)); 
fclose('all'); 