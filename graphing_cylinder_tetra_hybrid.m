function graphing_cylinder_tetra_hybrid = graphing_cylinder_tetra_hybrid(dummy)

n = 51;
wth = 10; 
h = wth/(n-1);
for i=1:n
    x(i) = (i-1)*h;
end
Ha = 1.5;
S = 0.05;
Pr = 21;
%phy1 = 0.05;
%phy2 = 0.05;
%phy3 = 0.05;
%phy4 = 0.05;
P0 = 0.3;
Hg = 0.1;  
Ec = 0.05;
alphae = 0.1;
Rd = 0.5;
beeta = 0.1;
lbdda = 5;
Mi = 0.15;
%%%%%%%%%%%%%%%%%%%%%%%%%

phy1 = 0.0;  phy2 = 0.0;  phy3 = 0.05;  phy4 = 0.05; %% Hybrid
 %%%aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);
U = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, 0.7, Rd, lbdda, Mi);
V = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, 1.0, Rd, lbdda, Mi);
W = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, 1.5, Rd, lbdda, Mi);
plot(x,U,'m-.', x,V,'m-.', x,W,'m-.')
hold all
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phy1 = 0.0;  phy2 = 0.05;  phy3 = 0.05;  phy4 = 0.05; %% Tri-Hybrid
 %%%aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);
U = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, 0.7, Rd, lbdda, Mi);
V = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, 1.0, Rd, lbdda, Mi);
W = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, 1.5, Rd, lbdda, Mi);

plot(x,U,'b--', x,V,'b--', x,W,'b--')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
phy1 = 0.05;  phy2 = 0.05;  phy3 = 0.05;  phy4 = 0.05; %% Tetra Hybrid 
 %%%aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg, Ec, beeta, alphae, Rd, lbdda, Mi);
U = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg, Ec, beeta, 0.7, Rd, lbdda, Mi);
V = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg, Ec, beeta, 1.0, Rd, lbdda, Mi);
W = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg, Ec, beeta, 1.5, Rd, lbdda, Mi);

plot(x,U,'g-', x,V,'g-', x,W,'g-')
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%legend('Cu-TiO_2/EG- - -Cu-TiO_2-Al_2O_3/EG. . . .Cu-TiO_2-CuO-Al_2O_3/EG ')
%legend('\alpha = -1  - - - - \alpha = - 2')
%legend('Pe = 0.25  - - - - Pe = 0.50')
%legend('Hybrid','Tri-Hybrid','Tetra-Hybrid')
%%%%%%%%%%%%%%%%%%(X axis)%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
xlabel('\xi')
%%%%%%%%%%%%%%%%(Y axis)%%%%%%%%%%%%%%%%%
%ylabel('f   ( \xi )' )
%ylabel('f ''  ( \xi )' )
%ylabel('g   ( \xi )' )
ylabel('g ''  ( \xi )' )
%ylabel('\theta  ( \xi )' )
%%%%%%%%%%%%%%%%%%%%%%%(Legends)%%%%%%%%%%%%%%%%%%%%%%
%legend('Pe = 1.0','Pe = 1.6','Pe = 2.2','Pe = 2.8','Pe = 3.4')
%legend('M = 1','M = 2','M = 3','M = 1','M = 2','M = 3','M = 1','M = 2','M = 3')
%legend('\gamma = 1.5','\gamma = 3.0','\gamma = 4.5','\gamma = 6.0','\gamma = 7.5')
%axis([0 3 0 1.2])
%axis([0 3 0 1])


graphing_cylinder_tetra_hybrid = i;
end