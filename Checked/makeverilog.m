makeremap; 

file = '../rtl/re_data.v'; 
delete(file); 
fid = fopen(file, 'a'); 
fprintf(fid, '\t//generated by ../Checked/makeverilog.m \n\n'); 

for i = 1 : size(coef, 2)
    fprintf(fid, '\tassign node[%d] = 28''h%.7X; \n', i - 1, floor(node(i)*2^27)); 
    fprintf(fid, '\tassign intcpt[%d] = 28''h%.7X; \n\n', i - 1, floor(coef(2,i)*2^27)); 
end

fprintf(fid, '\tassign node[%d] = 28''h%.7X; \n', i, floor(node(size(node,2))*2^27)); 

fclose('all'); 