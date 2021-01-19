clear variables ;
close all ;
clc;

A = [[1,-1,2,5];[1,1,4,5];[2,0,6,10]];
[m,n] = size(A);
[U,S,V] = svd(A); %svd de A
r = rank(A); %rang de A
ImA = U(:,1:r);  %matrice contenant les vecteurs générateurs de ImA 
KerA = V(:,r+1:n) ; %et KerA
%résultats trouvés en td
ImATD = [[1;1;2],[-1;1;0]];
KerATD = [[5;0;0;-1],[3;1;-1;0]];
%Vérification
rank([ImA,ImATD])-r
rank([KerA,KerATD])-(n-r)