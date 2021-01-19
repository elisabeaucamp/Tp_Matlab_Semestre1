clear all;
close all;
clc;

i=complex(0,1);

% axe fréquentiel
nu_min=-10;
nu_max=10;
nu_step=0.1;
nu=nu_min:nu_step:nu_max;

% axe temporel
tmin=-10;
tmax=10;
pas=0.1;
t=[tmin:pas:tmax];
n=length(t);

%fonctions
f0=(1+t.^2).^(-1);
f=f0+0.05*randn(1,n);

figure(1);
plot(t,f);hold on;

figure (2);
largeurs =[1,0.1,0.4,0.6];
for i = 1:4 ;
    a = largeurs(i);
    lissage = conv(f,porte(t./a),'same');
    subplot(2,2,i);hold on;
    plot(t,lissage./max(lissage),'k');
    plot(t,f,'r');
    plot(t,f0,'g');
end

for k = 1:length(nu)
    tf_porte(k)= trapz(t,porte(t).*exp(-2*i*pi*nu(k)*t)) ; % (commande trapz)
end

for k = 1:length(nu)
    tf_f(k)= trapz(t,f.*exp(-2*i*pi*nu(k)*t)) ; % (commande trapz)
end

tf_produit = tf_f.*tf_porte


for k = 1:length(t)
    tf_inv = trapz(nu,tf_produit.*exp(2*i*pi.*nu.*t(k))) ; % (commande trapz)
end






