clear variables ;
close all ;
clc ;
figure(1);
hold on;
a=2;
b=-5;
c=1;
n=10;
x2=-3:0.1:3;
y2=-2.5:0.1:4;
z2=-8:1:8;
[X2,Y2]=meshgrid(x2,y2);
Z2=-(a*X2+b*Y2)/c;
C(:,:,1)=zeros(size(Z2));     % red
C(:,:,2)=0.8*ones(size(Z2));  % green
C(:,:,3)=0.8*ones(size(Z2));  % blue
mesh(X2,Y2,Z2,C);
grid on ;

%%Question2
x = -2 + 4*(rand(1,n));
y = -2 + 4*(rand(1,n));
z = -8 + 14*(rand(1,n));
plot3(x,y,z,'.b');
plot3(0,0,0,'*r');
view(-60,60);
axis('equal');

%%Question3
N = [a;b;c] ; %vecteur colonne normal au plan
N = N/norm(N);
P = eye(size(N*N')) - N*N' ;
U = [x;y;z] ; %matrice 3*n contenant les coordonées des points Pi
V = zeros (3,n) ; %init de la matrice 3*n contenant les coordonées des points Qi
for k = 1:n
    V(:,k) = P*U(:,k) ;
end
plot3(V(1,:),V(2,:),V(3,:),'.r') ; %on relie les Pi entre eux
for i = 1:n
    plot3([U(1,i),V(1,i)],[U(2,i),V(2,i)],[U(3,i),V(3,i)],'k-')
end

%%Question4
delta = 4 ;
dV = -delta/2 + delta*rand(size(V)); %perturbation(matrice3*n)
W = V + dV ;
plot3(W(1,:),W(2,:),W(3,:), '.m') ; 
%calcul du plan passant au plus près des points Ri
A = [W(1,:)',W(2,:)'] ;
v = W(3,:)';
u = inv(A'*A)*A'*v ;
%affichage du plan (s'inspire de la question1)
%angle
N2 = [u(1),u(2),-1];
N2 = N2/norm(N2) ;
theta = acos((sum(N.*N2)/(norm(N)*norm(N2)))); %produit scalaire N'N2 = norme(N)*norme(N2)*cosalpha
if theta > pi/2 
    theta = pi - theta ;
end
theta = theta*180/pi ;