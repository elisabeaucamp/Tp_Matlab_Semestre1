clear variables;
close all;
clc;

% motif de base
F0=2*[-0.5,-0.5,-5,-3,-10,-8,-9,-6,-6,-2,-5,-2,0,2,5,2,6,6,9,8,10,3,5,0.5,0.5;  % abscisses
0,10,9,12,17,17,20,20,22,17,27,25,30,25,27,17,22,20,20,17,17,12,9,10,0]; % ordonnées  
[m,n]=size(F0);

% dimension du cadre d'affichage
L=200; 
cadre=[-L,L,-L,L];

% affichage du motif de base
color=[0,0,0];
fill(F0(1,:),F0(2,:),color);
axis('equal');
axis(cadre);
hold on;

%translation
u = [-80;60] ;
F1 = F0 + u .*ones(1,n) ;
color=[1,0,0] ; %rouge
fill(F1(1,:),F1(2,:),color) ;

%symétrie
N = [sqrt(2)/2;sqrt(2)/2] ;
S = 2*N*N' - eye(size(N*N'));
F2 = S*F1 ;
color = [0,1,0] ; %vert
fill(F2(1,:),F2(2,:),color);

x = [-L,L] ;
y = x ;%équation de la droite
plot(x,y,'g--');

%Rotation
theta = -2*pi/3 ;
R = [cos(theta),-sin(theta);sin(theta),cos(theta)] ;
F3 = R*F2 ;
color = [0,0,1] ; %bleu
fill(F3(1,:),F3(2,:),color) ;

t = 0:0.01:2*pi ;
G2 = mean(F2');%centre de la feuille
% r = norm([0;0],G2) ; %rayon du cercle
plot(G2(1),G2(2),'*r') ;

% n = 30 ;
% for i = 0:n ;
%     Ni = [rand();rand()] ;
%     Ni = Ni/norm(Ni) ;
%     Si = 2*Ni*Ni' - eye(2,2) ;
%     Fi = Si * F1 ;
%     color=rand(1,3);
%     fill(Fi(1,:),Fi(2,:),color) ;
% end
    
n2 = 300 ;
for i = 1:n2
    theta = 2*pi*rand() ;
    Ri = [cos(theta),-sin(theta);sin(theta),cos(theta)] ;
    Fi = Ri * F0 ;
    u = -L + 2*L*rand(2,1) ;
    Fi = Fi + u*ones(1,n) ;
    color=[rand(1,2),0] ; 
    fill(Fi(1,:),Fi(2,:),color) ;
end

    
    
    
    