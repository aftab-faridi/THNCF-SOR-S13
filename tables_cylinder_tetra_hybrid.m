function tables_cylinder_tetra_hybrid = tables_cylinder_tetra_hybrid(dummy)

n = 101;
wth = 10; 
h = wth/(n-1);
for i=1:n
    x(i) = (i-1)*h;
end
Ha = 1.5;
S = 0.03;
Pr = 21;
phy1 = 0.05;    %Ag                  Di- hybrid     (Ta - Cu / Blood) 
phy2 = 0.05;    %Au                  Tri- hybrid    (Ta - Cu - Au / Blood)
phy3 = 0.05;    %Ta                  Tetra- hybrid  (Ta - Cu - Au - Ag / Blood)
phy4 = 0.05;    %Cu
P0 = 0.3;
Hg = 0.1;  
Ec = 0.01;
alphae = 0.1;
Rd = 0.3;
beeta = 0.01; % casson fluid case 
lbdda = 5;
Mi = 0.15;
   
%%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi)
    
x(1) = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, 0.01);
x(2) = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, 0.02);
x(3) = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, 0.03);
%x(4) = aftab_cylinder_tetra_hybrid(n , wth,Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);
%x(5) = aftab_cylinder_tetra_hybrid(n , wth,Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);

disp('DATA STARTS')
for i = 1:3
    disp(x(i))
end

disp('DATA ENDS')





tables_cylinder_tetra_hybrid = i;
end