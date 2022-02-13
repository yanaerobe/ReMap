makeremap; 

file = '../design_files/re_data.v'; 
delete(file); 
fid = fopen(file, 'a'); 
fprintf(fid, '//generated by ../Checked/makeverilog.m \n\n'); 
for i = 1 : 41 
    fprintf(fid, 'assign node[%d] = 28''h%.7X; \n', i - 1, floor(node(i)*2^27)); 
    fprintf(fid, 'assign intcpt[%d] = 28''h%.7X; \n\n', i - 1, floor(coef(2,i)*2^27)); 
end
fclose('all'); 