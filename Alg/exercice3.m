clear variable ;
close all ;

n = 6;
b = [-1,-1,-1,-1,-1]
A =  diag(diag(2*ones(n))) + diag(diag(-1*ones(n-1)),-1) + diag(diag(-1*ones(n-1)), 1);
eps = 1e-6; %précision
disp(A);
%Initialisation
lambda0 = 1; %valeur propre initiale
e0 = rand(n,1) ; %vecteur propre initial
delta = 1; %diff entre 2 valeurs propres consécutives
lambda_array=[lambda0]; %stockage des valeurs de la valeur propre
while delta > eps
    e1 = A*e0;
    lambda = norm(e1)/norm(e0) ;
    delta = abs(lambda - lambda0) ;
    lambda_array = [lambda_array, lambda]  ;
    lambda0 = lambda ;
    e0 = e1./norm(e1) ;
end
lambda0
eig(A)
%%question2
D = zeros(n,n); %matrice diagonale
P = zeros(n,n); %matrice de passage
B = A;
for k = 1:n
    if k >1
        B = B - (lambda0/(e0'*e0))*(e0*e0') ;
    end
    lambda0 = 1; %valeur propre initiale
    e0 = rand(n,1) ; %vecteur propre initial
    delta = 1; %diff entre 2 valeurs propres consécutives
    lambda_array=[lambda0]; %stockage des valeurs de la valeur propre
    while delta > eps
        e1 = B*e0;
        lambda = norm(e1)/norm(e0) ;
        delta = abs(lambda - lambda0) ;
        lambda_array = [lambda_array, lambda]  ;
        lambda0 = lambda ;
        e0 = e1./norm(e1) ;
    end
%     lambda0
%     eig(A)
    D(k,k) = lambda
    P(:,k) = e0
end
A2 = P*D*inv(P)