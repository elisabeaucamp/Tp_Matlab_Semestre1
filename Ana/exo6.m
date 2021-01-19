clear variables;
close all;
clc;
%% question1
n=3000;
m=n;
M=zeros(n,m);
for p=floor(0.49*n):floor(0.51*n)
    for q=floor(0.49*m):floor(0.51*m)
        M(p,q)=1;
    end
end
subplot(1,2,1);
imshow(M);
TF_M_real = abs(fftshift(fft2(M)));
TF_M_int = uint8(TF_M_real);
subplot(1,2,2);
imshow(TF_M_int);
%fenetre circulaire
M2 = zeros(m,n);
rayon = m/200;
for i = 1:m
    for j = 1:n
        if (j - (m/2))^2 + (i - (n/2))^2 < rayon^2
            M2(i,j)=1;
        end
    end
end
figure(2);
subplot(1,2,1);
imshow(M2);
TF_M2_real = abs(fftshift(fft2(M2)));
TF_M2_int = uint8(TF_M2_real);
subplot(1,2,2);
imshow(TF_M2_int);

%% question 2

[x,y]=meshgrid(1:n,1:m);
M3 = cos(0.5*x+0.5*y);
TF_M3_real = abs(fftshift(fft2(M3)));
TF_M3_int = uint8(TF_M3_real);
M4 = cos(0.3*x+0.7*y);
TF_M4_real = abs(fftshift(fft2(M4)));
TF_M4_int = uint8(TF_M4_real);
M5 = cos(0.1*x+0.9*y);
TF_M5_real = abs(fftshift(fft2(M5)));
TF_M5_int = uint8(TF_M5_real);


figure(3);
subplot(3,2,1);
imshow(M3);
subplot(3,2,2);
imshow(TF_M3_int);
subplot(3,2,3);
imshow(M4);
subplot(3,2,4);
imshow(TF_M4_int);
subplot(3,2,5);
imshow(M5);
subplot(3,2,6);
imshow(TF_M5_int);
















