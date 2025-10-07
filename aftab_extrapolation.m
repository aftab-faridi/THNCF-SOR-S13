function aftab_extrapolation = aftab_extrapolation(dddumy)
n = 101;
wth = 2;

Ha = 1.5;
S = 0.05;
Pr = 21;
phy1 = 0.0;
phy2 = 0.0;
phy3 = 0.0;
phy4 = 0.0;
P0 = 0.3;
Hg = 0.1;  
Ec = 0.05;
alphae = 0.1;
Rd = 0.5;
beeta = 0.01; % casson fluid case 
lbdda = 5;
Mi = 0.15;

format long
% BCs start


% BCs end
% Grid#1
F = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);

F_1 = F; 

n = (2*n-1);

%Grid#2
F = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);

F_2 = F; 

n = (2*n-1);

% Grid#3
F = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi);

F_3 = F; 



h = wth/(n-1);
for i=1:n
    x(i) =  -1+(i-1)*h;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%STARTS%%%%%%%%%
%%%%%% Grid Location %%%%%%%%%
disp('Grid Points')

for i= 1:40:n
        disp(x(i))
end

disp('First grid solution')

for i=1:10:101
    disp(F_1(i))
end

disp('Second grid solution')

for i=1:20:201
    disp(F_2(i))
end
disp('Third grid solution')

for i=1:40:401
    disp(F_3(i))
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%END

aftab_extrapolation = i;
end