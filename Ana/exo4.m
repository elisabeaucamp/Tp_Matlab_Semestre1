clear variables ;
close all ;
clc ;
D = 4 ;
N = 2^16 ;
dt = 1/N ;
t = -D:dt:D ;
sigma = 2.^[-1:-2:-7] ;

%% Question 1

for k = 1:4
    g = (1/(sigma(k)*sqrt(2*pi)))*exp(-t.^2./(2*sigma(k).^2));
    figure (1);
    subplot(2,2,k);
    plot(t,g);
    %TF de g
    [tfg,nu] = TransFourier(g,t);
    figure(2);
    subplot(2,2,k);
    plot(nu,tfg);
    axis([-100,100,0,1]) ;
end

%% Question 2

nu0 = 5 ;
s = exp(-pi*t.^2).*cos(2*pi*nu0*t);
[tfs,nu] = TransFourier(s,t);
figure(3);
subplot(1,2,1);
plot(t,s);
subplot(1,2,2);
plot(nu,tfs);
axis([-10,10,0,1]);
color = ['m','r','g','b'];
for k = 1:4
    g_sigma = (1/(sigma(k)*sqrt(2*pi)))*exp(-t.^2./(2*sigma(k).^2));
    y = conv(s,g_sigma,'same');
    y = y./max(y);
    figure(4);
    subplot(4,1,k);
    plot(t,s,'k');
    hold on;
    plot(t,y,color(k));
end














