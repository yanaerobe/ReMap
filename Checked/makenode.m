make; 

gr = 2^-7./Gr; 

rgn1 = m1(1, 1 : 4); 
i = 1; 
num = rgn1(1) + gr(1); 
while num < m1(1,2)
    rgn1 = [rgn1(1 : i), num, rgn1(i+1:end)]; 
    num = num + gr(1); 
    i = i + 1; 
end
%disp(rgn1);

rgn2 = m1(2, 1 : 3); 
i = 1; 
num = rgn2(1) + gr(2); 
while num < m1(2,2)
    rgn2 = [rgn2(1 : i), num, rgn2(i+1:end)]; 
    num = num + gr(2); 
    i = i + 1; 
end
%disp(rgn2); 

rgn3 = m1(3, 1 : 3); 
i = 1; 
num = rgn3(1) + gr(3); 
while num < m1(3,2) - 0.0000000000001
    rgn3 = [rgn3(1 : i), num, rgn3(i+1:end)]; 
    num = num + gr(3); 
    i = i + 1; 
end
%disp(rgn3);

rgn4 = m1(4, 1 : 4); 
i = 1; 
num = rgn4(1) + gr(4); 
while num < m1(4,2) - 0.0000000000001
    rgn4 = [rgn4(1 : i), num, rgn4(i+1:end)]; 
    num = num + gr(4); 
    i = i + 1; 
end
%disp(rgn4);

node = [rgn1, rgn2, rgn3, rgn4]; 
%fprintf('%f ', node); 
%fprintf('\n'); 