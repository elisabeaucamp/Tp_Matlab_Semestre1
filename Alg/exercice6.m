clear variables ;
close all ;
clc ;
myFile = 'einstein.jpg' ;
A = imread(myFile) ; %convertir l'image en trois matrices (une par couleurs RVB)
A = A(:,:,1) ; %récupère que la première matrice
[m,n] = size(A) ;
figure(1);
imshow(A) ;
A=double(A) ; %convertit les entiers en réels
[U,S,V]=svd(A) ;
figure(2) ;
plot(diag(S)) ;
k_array = [5,40,100,200] ;
tau = zeros(1,4) ;
figure(3);
for j = 1:4
    k = k_array(j) ;
    Ak = zeros(m,n) ; %init
    for i = 1:k
        Ak = Ak + S(i,i)*U(:,i)*V(:,i)';
    end
Ak = uint8(Ak) ;
subplot(2,2,j) ;
imshow(Ak) ;
tau(j) = 1 - (k*(m + n + 1))/(m*n)
end