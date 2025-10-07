clc;
clear;

% Inputs
n = 101;
wth = 1.0;
Ha = 1.0;
S = 0.5;
Pr = 6.2;

% Volume fractions (Ag, Au, Ta, Cu)
phy1 = 0.01;
phy2 = 0.01;
phy3 = 0.01;
phy4 = 0.01;

% Physical parameters
P0 = 1.0;
Hg = 0.5;
Ec = 0.1;
beeta = 0.5;
alphae = 0.1;
Rd = 0.1;
lbdda = 0.1;
Mi = 0.1;

% Call the MATLAB function and get skin friction and Nusselt number
[q1, q2] = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, ...
                                       phy1, phy2, phy3, phy4, ...
                                       P0, Hg, Ec, beeta, alphae, ...
                                       Rd, lbdda, Mi);

% Display results
fprintf('Skin Friction Coefficient (Q1): %f\n', q1);
fprintf('Nusselt Number (Q2): %f\n', q2);
