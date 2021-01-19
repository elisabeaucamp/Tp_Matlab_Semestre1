clear variables ;
close all ;
clc ;

%% Question1
D = 1;
N = 2^12;
dt = 1/N;
t = -D:dt:D-dt;%ne pas oublier le - dt
T1 = 2^-5;
T2 = 2^-6;
peigne_1 = peigne(T1,t);
peigne_2 = peigne(T2,t);

figure(1);
subplot(2,1,1);
plot(t,peigne_1);
subplot(2,1,2);
plot(t,peigne_2);

%% Question 2
nu0 = 5 ;
s = exp(-pi*t.^2).*cos(2*pi*nu0*t);
z_T2 = s.*peigne_2;
[tfs,nu_1] = TransFourier(s,t);
[tfz,nu_2] = TransFourier(z_T2,t);
tfz = tfz/max(tfz);
figure(2);
subplot(3,1,1);
plot(t,s);
hold on ;
plot(t,z_T2,'.r');
subplot(3,1,2);
plot(nu_1,tfs,'k');
axis([-50,50,0,1]);
subplot(3,1,3);
plot(nu_2,tfz,'r');
axis([-500 500 0 1]);

%explication ed la périodisation
%z(nu) = Tf(z(t)) = TF(s(t)) conv TF (peigne_1/T0(t)) = nu0(TF(s)conv TF(peigne))
% donc z est la périodisée de s de période nu0 = 1/T0








