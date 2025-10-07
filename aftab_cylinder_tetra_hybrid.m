function aftab_cylinder_tetra_hybrid = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg, Ec, beeta, alphae, Rd, lbdda, Mi)

     %[f, p] = aftab_cylinder_tetra_hybrid(n , wth, Ha, S, Pr, phy1, phy2, phy3, phy4, P0, Hg,  Ec, beeta, alphae, Rd, lbdda, Mi)


rs1  = 10500;        rs2  = 19320;      rs3  = 16650;           rs4 = 8933;             rf = 1063;     
ks1  = 429;          ks2  = 314;        ks3  = 0.52;            ks4 = 401;              kf = 0.492;    
cps1 = 235;          cps2 = 129;        cps3 = 686.2;          cps4 = 385;             cpf = 3594;    
ss1  = 6.30*10^7;    ss2  = 4.10*10^7;  ss3  = 7.70*10^6;       ss4 = 5.96*10^7;        sf = 6.67*10^-1;    
%Silver(Ag)-phy1,   %% Gold(Au)-phy2,   %%% Tantalum(Ta)-phy3,       %%%%Copper(Cu)-phy4,    % Blood (f) 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ERROR
% T1 = ( (1-phy1)^2.5 )*( (1-phy2)^2.5 )*( (1-phy3)^2.5 )*( (1-phy4)^2.5 )^-1;
% CORRECTED
T1 = (( (1-phy1)^2.5 )*( (1-phy2)^2.5 )*( (1-phy3)^2.5 )*( (1-phy4)^2.5 ))^-1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d0 = (rs1/rf);
d00 = (rs2/rf);
d000 = (rs3/rf);
d0000 = (rs4/rf);

T2 = ( 1-phy4)*(   ( 1-phy3)*( ( 1-phy2 )* ( 1-phy1 + phy1*d0  )+ phy2*d00  ) + phy3*d000   ) + phy4*d0000;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
d01 = (rs1*cps1)/(rf*cpf);
d02 = (rs2*cps2)/(rf*cpf);
d03 = (rs3*cps3)/(rf*cpf);
% ERROR
% d04 = (rs3*cps4)/(rf*cpf);
% CORRECTED
d04 = (rs4*cps4)/(rf*cpf);

T3 = ( 1-phy4)*(   ( 1-phy3)*(  ( 1-phy2 )* ( 1-phy1 + phy1*d01  )+ phy2*d02 )  + phy3*d03   )   + phy4*d04;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nn = 3;
knf = (   ks1 + (nn-1)*kf - (nn-1)*phy1*( kf - ks1 )    )/(  ks1 + (nn-1)*kf + phy1*( kf - ks1 )    );
kk = knf*(   ks2 + (nn-1)*knf - (nn-1)*phy2*( knf - ks2 )    )/(  ks2 + (nn-1)*knf + phy2*( knf - ks2 )    );
dkhnf = kk*(   ks3 + (nn-1)*kk - (nn-1)*phy3*( kk - ks3 )    )/(  ks3 + (nn-1)*kk + phy3*( kk - ks3 )    );
dkhnf4 = dkhnf*(   ks4 + (nn-1)*dkhnf - (nn-1)*phy4*( dkhnf - ks4 )    )/(  ks4 + (nn-1)*dkhnf + phy4*( dkhnf - ks4 )    );

T4 = dkhnf4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
snf = (   ss1 + 2*sf - 2*phy1*( sf - ss1 )    )/(  ss1 + 2*sf + phy1*( sf - ss1 )    );
sgma = snf*(   ss2 + 2*snf - 2*phy2*( snf - ss2 )    )/(  ss2 + 2*snf + phy2*( snf - ss2 )    );

dsgma = sgma*(   ss3 + 2*sgma - 2*phy3*( sgma - ss3 )    )/(  ss3 + 2*sgma + phy3*( sgma - ss3 )    );

dsgma4 = dsgma*(   ss4 + 2*dsgma - 2*phy4*( dsgma - ss4 )    )/(  ss4 + 2*dsgma + phy4*( dsgma - ss4 )    );

T5 = dsgma4;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

format long
TOL = 10^-7;
counter = 0;
h = wth/(n-1);% for ordinary program contl=2, contl2 = 2;contl3 = 2;

for i=1:n
    x(i) = (i-1)*h;
end

% BCs
f(1) = S;
f(n) = 0;
p(1) = 1;
p(n) = 0;
ht = ones(1,n);
ht(1) = 1;
ht(n) = 0;
g(1) = 0;
g(n) = 0;
s(1) = 0;
% ERROR
% s(n) = 1;
% CORRECTED s(∞) = 0
s(n) = 0;
% BCs end

fold = f;
pold = p;
htold = ht;
sold = s;
gold = g;
W = 0.95;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% SOR %%%%%%%%%%%%%%%%%%
while(counter<1000000)	        
    

for i=2:(n-1)
                        
            
            d1 = 1 + (1/beeta);
            
            d2 = 1 + 2*alphae*x(i);
            
            A = 4*d1*d2*(T1/T2) + 2*h*h* ( p(i) + (T5/T2)*Ha^2 - (T1/T2)*P0) ;
            
            B = 2*d1*d2*(T1/T2) + h* ( f(i) + 2*alphae*d1*(T1/T2) );
            
            C = 2*d1*d2*(T1/T2) - h* ( f(i) + 2*alphae*d1*(T1/T2) );
            
            Dd1 = 0.5*( g(i+1)-g(i-1) )*( g(i+1)-g(i-1) );
            Dd2 = 2*g(i)*( g(i+1)-2*g(i)+g(i-1) );
            Dd = Mi*(1/T3)* ( Dd1 - Dd2 - 2*h*h);
        
            
            p(i) = (W/A)*(  B*p(i+1) + C*p(i-1) +Dd) + (1-W)*p(i);

           
end
%%%%%%%

for i=2:(n-1)
           
            d2 = 1 + 2*alphae*x(i);
            d3 = 1 + 4/3*Rd;
            
            A = 4*d2*d3*(T4/T3) + 2*h*h*Pr*( p(i) + (1/T3)*Hg ) ;
            
            B = 2*d2*d3*(T4/T3) - h* ( Pr*f(i) + 2*alphae*(T4/T3) );
            
            C = 2*d2*d3*(T4/T3) + h* ( Pr*f(i) + 2*alphae*(T4/T3) );
            
            D = d1*d2*Pr*Ec*(  ( p(i+1)- p(i-1) )/(2*h)   )*(  ( p(i+1)- p(i-1) )/(2*h)   )  +  Ha*Ha*Pr*Ec*p(i)*p(i);
           
           
           ht(i) = (  W / A )*(  C*ht(i+1) + B*ht(i-1) + 2*h*h*D ) + (1-W)*ht(i);
           
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
f(2) = f(1) + (h/24)*( 9.0*p(1) + 19.0*p(2) - 5.0*p(3) + p(4) );
for i = 2:(n-1)
f(i+1) = f(i-1) + (h/3)*( p(i-1) + 4.0*p(i) + p(i+1) );
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

s(1) =  (1/3)*( 4*s(2) - s(3) ); %%derivative BC 

for i=2:(n-1)
            
            A0  = 4*lbdda*(1/T3) ;
            A1  = 2*lbdda*(1/T3) + h*f(i); 
            A2  = 2*lbdda*(1/T3) - h*f(i);
            
            Dd = - 2*g(i)*( f(i+1)-2*f(i)+f(i-1) );

            s(i) = (W/A0)*( A1*s(i+1) + A2*s(i-1) + Dd ) + (1-W)*s(i);
end

g(2) = g(1) + (h/24)*( 9.0*s(1) + 19.0*s(2) - 5.0*s(3) + s(4) );
for i = 2:(n-1)
g(i+1) = g(i-1) + (h/3)*( s(i-1) + 4.0*s(i) + s(i+1) );
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fnew = f;
pnew = p;
htnew = ht;
snew = s;
gnew = g;


check1 = max(abs(fnew - fold));
check2 = max(abs(pnew - pold));
check3 = max(abs(htnew - htold));
check4 = max(abs(gnew - gold));
check5 = max(abs(snew - sold));

cheq1 = max(max(check1,check2), check3);
cheq = max(max(check4, check5),cheq1);

if( cheq < TOL);break; end
disp('CHEQ'); disp(cheq)
counter = counter +1;
fold = fnew;
pold = pnew;
htold = htnew;
gold = gnew;
sold = snew;
end

i = n;
Q = ( 3*p(i)-4*p(i-1)+p(i-2) )/(2*h);

disp( 'COUNTER' ); disp( counter )			  
disp( 'UPPER Boundary Test' ); disp( Q )			  

%plot(eta, ht)

%disp( 'STRESS_NO EXTRA' ); disp( test )			  
%disp( 'RATE_HEAT_NO EXTRA' ); disp( der_one_HT )
a1 = (- p(3) + 4*p(2) - 3*p(1))/(2*h); 
a2 = (- ht(3) + 4*ht(2) - 3*ht(1))/(2*h);
d1 = 1 + (1/beeta);
d2 = 1 + 4/3*Rd;

Q1 = a1*d1*( (1-phy1)^-2.5 )*( (1-phy2)^-2.5 )*( (1-phy3)^-2.5 )*( (1-phy4)^-2.5 ); % skin friction
Q2 = -a2*d2*T4; % heat rate


aftab_cylinder_tetra_hybrid = f; % f, p, ht, g, s, Q1, Q2
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%