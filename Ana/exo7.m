clear variables;
close all;
clc;

A=imread('barbara.jpg');
[a,b]=size(A);
figure(1);
subplot(3,2,1);
imagesc(A);
colormap gray;
TF_A = fftshift(fft2(A));
subplot(3,2,2);
imagesc(log10(abs(TF_A)));

M=zeros(a,b);
for p=floor(0.35*b):floor(0.65*b)
    for q=floor(0.35*a):floor(0.65*a)
        TF_A(p,q)= 0 ;
    end
end

TF_A_INV = ifft2(TF_A);
subplot(3,2,3);
imagesc(log10(abs(TF_A)));
subplot(3,2,4);
imagesc(abs(TF_A_INV));
A=imread('barbara.jpg');
[a,b]=size(A);
TF_A = fftshift(fft2(A));

for p=floor(0.35*b):floor(0.65*b)
    for q=floor(0.35*a):floor(0.65*a)
        M(p,q)= TF_A(p,q) ;
    end
end

TF_M_INV = ifft2(M);

subplot(3,2,5);
imagesc(log10(abs(M)));
subplot(3,2,6);
imagesc(abs(TF_M_INV));