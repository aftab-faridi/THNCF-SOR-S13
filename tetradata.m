function tetradata = tetradata(dummy)




rs1 = 10.5;       rs2 = 3970;          rs3 = 4250;        rs4 = 4250;             rf = 1063;    % rf = 888.23; %silver(Ag), Alumina Al2O3, Titanium Dioxide (TiO2), blood, Engine oil
ks1 = 429;        ks2 = 40;            ks3 = 8.9538;      ks4 = 8.9538;           kf = 0.492;    %kf = 0.145;
cps1 = 235;       cps2 = 765;          cps3 = 686.2;      cps4 = 686.2;           cpf = 3594;    %cpf = 1880.3;
ss1 = 3.6*10^7;   ss2 = 1.0*10^-10;    ss3 = 1.0*10^-12;  ss4 = 1.0*10^-12;       sf = 0.8;      %sf = 23.004.;



d1 = ( (1-phy1)^-2.5 )*( (1-phy2)^-2.5 )*( (1-phy3)^-2.5 )*( (1-phy4)^-2.5 );
d0 = (rs1/rf);
d00 = (rs2/rf);
d000 = (rs3/rf);
d0000 = (rs4/rf);
d2 = ( 1-phy4)*(   ( 1-phy3)*( ( 1-phy2 )* ( 1-phy1 + phy1*d0  )+ phy2*d00  ) + phy3*d000   ) + phy4*d0000;
%%%%%%%%%%%%%%%%%%%%%%%%
Re = Re * (d2/d1);
snf = (   ss1 + 2*sf - 2*phy1*( sf - ss1 )    )/(  ss1 + 2*sf + phy1*( sf - ss1 )    );
sgma = snf*(   ss2 + 2*snf - 2*phy2*( snf - ss2 )    )/(  ss2 + 2*snf + phy2*( snf - ss2 )    );

dsgma = sgma*(   ss3 + 2*sgma - 2*phy3*( sgma - ss3 )    )/(  ss3 + 2*sgma + phy3*( sgma - ss3 )    );

dsgma4 = dsgma*(   ss4 + 2*dsgma - 2*phy4*( dsgma - ss4 )    )/(  ss4 + 2*dsgma + phy4*( dsgma - ss4 )    );

Mn = dsgma4*(Mn/d2);
%%%%%%%%%%%%%%%%%%%%%%%%
nn = 2;
knf = (   ks1 + (nn-1)*kf - (nn-1)*phy1*( kf - ks1 )    )/(  ks1 + (nn-1)*kf + phy1*( kf - ks1 )    );
kk = knf*(   ks2 + (nn-1)*knf - (nn-1)*phy2*( knf - ks2 )    )/(  ks2 + (nn-1)*knf + phy2*( knf - ks2 )    );
dkhnf = kk*(   ks3 + (nn-1)*kk - (nn-1)*phy3*( kk - ks3 )    )/(  ks3 + (nn-1)*kk + phy3*( kk - ks3 )    );
dkhnf4 = dkhnf*(   ks4 + (nn-1)*dkhnf - (nn-1)*phy4*( dkhnf - ks4 )    )/(  ks4 + (nn-1)*dkhnf + phy4*( dkhnf - ks4 )    );

d01 = (rs1*cps1)/(rf*cpf);
d02 = (rs2*cps2)/(rf*cpf);
d03 = (rs3*cps3)/(rf*cpf);
d04 = (rs3*cps4)/(rf*cpf);
d11 = ( 1-phy4)*(   ( 1-phy3)*(  ( 1-phy2 )* ( 1-phy1 + phy1*d01  )+ phy2*d02 )  + phy3*d03   )   + phy4*d04;
Pr = ( 1/dkhnf4 )*Pr*( d1/d2 )*d11;
Re0 = Re* (d1/d2);
d4 = dkhnf4;
%%%%%%%%%%%







rs1 = 10.5;       rs2 = 3970;          rs3 = 4250;        rs4 = 4250;             rf = 1063;    % rf = 888.23; %silver(Ag), Alumina Al2O3, Titanium Dioxide (TiO2), blood, Engine oil
ks1 = 429;        ks2 = 40;            ks3 = 8.9538;      ks4 = 8.9538;           kf = 0.492;    %kf = 0.145;
cps1 = 235;       cps2 = 765;          cps3 = 686.2;      cps4 = 686.2;           cpf = 3594;    %cpf = 1880.3;
ss1 = 3.6*10^7;   ss2 = 1.0*10^-10;    ss3 = 1.0*10^-12;  ss4 = 1.0*10^-12;       sf = 0.8;      %sf = 23.004.;



d1 = ( (1-phy1)^-2.5 )*( (1-phy2)^-2.5 )*( (1-phy3)^-2.5 )*( (1-phy4)^-2.5 );
d0 = (rs1/rf);
d00 = (rs2/rf);
d000 = (rs3/rf);
d0000 = (rs4/rf);
d2 = ( 1-phy4)*(   ( 1-phy3)*( ( 1-phy2 )* ( 1-phy1 + phy1*d0  )+ phy2*d00  ) + phy3*d000   ) + phy4*d0000;
%%%%%%%%%%%%%%%%%%%%%%%%
Re = Re * (d2/d1);
snf = (   ss1 + 2*sf - 2*phy1*( sf - ss1 )    )/(  ss1 + 2*sf + phy1*( sf - ss1 )    );
sgma = snf*(   ss2 + 2*snf - 2*phy2*( snf - ss2 )    )/(  ss2 + 2*snf + phy2*( snf - ss2 )    );

dsgma = sgma*(   ss3 + 2*sgma - 2*phy3*( sgma - ss3 )    )/(  ss3 + 2*sgma + phy3*( sgma - ss3 )    );

dsgma4 = dsgma*(   ss4 + 2*dsgma - 2*phy4*( dsgma - ss4 )    )/(  ss4 + 2*dsgma + phy4*( dsgma - ss4 )    );

Mn = dsgma4*(Mn/d2);
%%%%%%%%%%%%%%%%%%%%%%%%
nn = 2;
knf = (   ks1 + (nn-1)*kf - (nn-1)*phy1*( kf - ks1 )    )/(  ks1 + (nn-1)*kf + phy1*( kf - ks1 )    );
kk = knf*(   ks2 + (nn-1)*knf - (nn-1)*phy2*( knf - ks2 )    )/(  ks2 + (nn-1)*knf + phy2*( knf - ks2 )    );
dkhnf = kk*(   ks3 + (nn-1)*kk - (nn-1)*phy3*( kk - ks3 )    )/(  ks3 + (nn-1)*kk + phy3*( kk - ks3 )    );
dkhnf4 = dkhnf*(   ks4 + (nn-1)*dkhnf - (nn-1)*phy4*( dkhnf - ks4 )    )/(  ks4 + (nn-1)*dkhnf + phy4*( dkhnf - ks4 )    );

d01 = (rs1*cps1)/(rf*cpf);
d02 = (rs2*cps2)/(rf*cpf);
d03 = (rs3*cps3)/(rf*cpf);
d04 = (rs3*cps4)/(rf*cpf);
d11 = ( 1-phy4)*(   ( 1-phy3)*(  ( 1-phy2 )* ( 1-phy1 + phy1*d01  )+ phy2*d02 )  + phy3*d03   )   + phy4*d04;
Pr = ( 1/dkhnf4 )*Pr*( d1/d2 )*d11;
Re0 = Re* (d1/d2);
d4 = dkhnf4;
%%%%%%%%%%%


tetradata = i;
end