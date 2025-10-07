function comparison_code = comparison_code(dummy)



n = 51;
wth = 6;
h = wth/(n-1); 
for i=1:n
    x(i) = (i-1)*h;
end

Ha = 1.5;
S = 0.0;
Pr = 21;
phy1 = 0.0;
phy2 = 0.0;
phy3 = 0.0;
phy4 = 0.0;
P0 = 0.5;
Hg = 0.0;  
Ec = 0.0;
alphae = 0;
Rd = 0.0;
beeta = 0.65;
lbdda = 5;
Mi = 0.00000015;
%%%%%%%%%%%%%%%%%%%%%

[f, p] = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);

y1 = p;

for i=1:n
y2(i) = exp(-x(i));
end
plot( x,y1,'b-', x,y2,'g-*')
legend('Numerical Solution','Analytical Solution')

xlabel('\xi')
ylabel('f ''   ( \xi )' )

comparison_code = i;

end




