function contours_casson_cylinder = contours_casson_cylinder(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi)
                            
n2 = n;
d = 1;
n1 = n2;
hr = (2*d)/(n1-1);
for i=1:n1
    r(i)= -d + (i-1)*hr;
end
h = 2/(n2-1);
for i=1:n2
    eta(i)= -1 + (i-1)*h;
end


f = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);


for j=1:n2
    for i=1:n1
    z(i,j)= ( r(j) )^1 * f(i);
    %z(i,j)= ( r(i) )^1 * f(j);
    end
end
contour(r, eta, z, 300)
xlabel('x')
ylabel('r' )


contours_casson_cylinder = i;
end