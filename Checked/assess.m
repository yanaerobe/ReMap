%
dx = 1e-5; 
x = 0 : dx : 1; 
yl = log2(1+x); 
yre = arrayfun(@CastrARM16, x); 
yrm = arrayfun(@castrARM4, x); 
%
hold on; 
pre = plot(x, yre,'r'); 
pl = plot(x, yl,'b--'); 
prm = plot(x, yrm,'g'); 
xlabel('x'); 
ylabel('f(x+1)'); 
legend({'ReMap', 'Logarithm', 'Range Mapping'}, 'Location', 'northwest'); 
hold off; 
%}
Fre = dx*cumtrapz(yl - yre); 
Fre_abs = dx*cumtrapz(abs(yl - yre)); 

Frm = dx*cumtrapz(yl - yrm); 
Frm_abs = dx*cumtrapz(abs(yl - yrm)); 

disp('re');
disp(Fre(end));
disp(Fre_abs(end));


disp('rm'); 
disp(Frm(end));
disp(Frm_abs(end));
%}

%{
rm_a = 15072.243021; 
rm_d = 2.04-0.5; 
rm_p = 4.5644; 

re41_a = 18882.012610; 
re41_d = 1.89-0.5; 
re41_p = 5.5086; 

re6_a = 35464.553295; 
re6_d = 1.81-0.5; 
re6_p = 11.3432; 

re13_a = 22193.471738; 
re13_d = 1.64-0.5; 
re13_p = 6.5459; 

a41 = 100*(rm_a - re41_a)/rm_a; 
d41 = 100*(rm_d - re41_d)/rm_d; 
p41 = 100*(rm_p - re41_p)/rm_p; 

a6 = 100*(rm_a - re6_a)/rm_a; 
d6 = 100*(rm_d - re6_d)/rm_d; 
p6 = 100*(rm_p - re6_p)/rm_p; 

a13 = 100*(rm_a - re13_a)/rm_a; 
d13 = 100*(rm_d - re13_d)/rm_d; 
p13 = 100*(rm_p - re13_p)/rm_p; 

disp('41'); 
disp(a41); 
disp(d41); 
disp(p41); 

disp('6'); 
disp(a6); 
disp(d6); 
disp(p6); 

disp('13'); 
disp(a13); 
disp(d13); 
disp(p13); 
%}