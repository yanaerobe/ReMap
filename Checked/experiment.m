makeremap; 
file = '../Design Files/node.verilog'; 
fid = fopen(file, 'a'); 
fprintf(fid, '%.7X\n', floor(node.*2^27)); 
fclose('all'); 