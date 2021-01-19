clear variables :
close all ;
clc ;

i=complex(0,1);

% axe temporel
t_min=-5;
t_max=5;
t_step=0.01;
t=t_min:t_step:t_max;

% axe fréquentiel
nu_min=-10;
nu_max=10;
nu_step=0.1;
nu=nu_min:nu_step:nu_max;

% choix du signal
signal = 5;
switch signal
    case 1 
        f= porte(t) ;% signal
        tf_exact= sinc (nu);  % transformée de Fourier exacte
    case 2 
        f= porte(t-2);% signal
        tf_exact= sinc (nu).*exp(-2*i*pi.*nu.*2) ;  % transformée de Fourier exacte
    case 3 
        f= porte(t/3) ;% signal
        tf_exact= 3*sinc (3*nu) ;  % transformée de Fourier exacte
    case 4 
        f= t.*porte(t) ;% signal
        tf_exact = i.*(pi.*nu.*cos(pi.*nu)-sin(pi.*nu))/(2.*pi.^2.*nu.^2);  % transformée de Fourier exacte
    case 5 
        f = 2*triangle(t+1)+2*triangle(t)+2*triangle(t-1);
        tf_exact = 2.*(sinc(nu)).^2+2.*(sinc(nu)).^2.*exp(-2*i*pi*nu*1)+2.*(sinc(nu)).^2.*exp(-2*i*pi*nu*(-1));
end

% affichage du signal
figure(1);
plot (t,f) ; % (commande plot)
legend('signal');legend('boxoff');

% calcul de la transformée de Fourier (calcul approché)
tf_approx = zeros (1,length(nu)); % initialisation (commande zeros)
for k = 1:length(nu)
    tf_approx(k)= trapz (t,f.*exp(2*i*pi*nu(k)*t)) ; % (commande trapz)
end

% affichage de la TF
figure(2);

% partie réelle
subplot(2,2,1);hold on;
plot(nu,real(tf_exact));
plot(nu,real(tf_approx));
title('Real(TF)');
legend('exact.','approx');
legend('boxoff');

% partie imaginaire
subplot(2,2,2);hold on;
plot(nu,imag(tf_exact));
plot(nu,imag(tf_approx));
title('Imag(TF)');
legend('exact.','approx');
legend('boxoff');

% module
subplot(2,2,3);
hold on;
plot(nu,abs(tf_exact));
plot(nu,abs(tf_approx));
title('Module(TF)');
legend('exact.','aprox');
legend('boxoff');

% phase
subplot(2,2,4);hold on;
plot(nu,angle(tf_exact));
plot(nu,angle(tf_approx));
title('Phase(TF)');
legend('exact.','approx');
legend('boxoff');







