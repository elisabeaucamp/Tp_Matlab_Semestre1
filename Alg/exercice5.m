clear variables;
close all;
clc;

A = [[3;1;1],[-1;3;1]];
theta=0:0.1:2*pi;
x=cos(theta);
y=sin(theta);
subplot(121);hold on;
for k=1:length(theta)
    plot(x(k),y(k),'marker','.','color',[k/length(theta),0,k/length(theta)]);
end
title('cercle unité');
xlabel('x');
ylabel('y');
axis('equal');
axis([-1.5,1.5,-1.5,1.5]);
[U,S,V] = svd(A)
plot([0,V(1,1)],[0,V(2,1)], 'color','r','linewidth',2) ;
plot([0,V(1,2)],[0,V(2,2)], 'color','r','linewidth',2) ;

%% Image du cercle unité
subplot(1,2,2);
hold on;
for k = 1:length(theta)
    X = [x(k);y(k)] ;
    Y = A*X ;
    plot3(Y(1),Y(2),Y(3),'marker','.','color',[k/length(theta),0,k/length(theta)]);
    grid on;
end

%% Question suivante
plot3([0,U(1,1)*S(1,1)],[0,U(2,1)*S(1,1)],[0,U(3,1)*S(1,1)],'color','g','linewidth',2);
plot3([0,U(1,2)*S(2,2)],[0,U(2,2)*S(2,2)],[0,U(3,2)*S(2,2)],'color','g','linewidth',2);
plot3([0,U(1,1)],[0,U(2,1)],[0,U(3,1)],'color','b','linewidth',2);
plot3([0,U(1,2)],[0,U(2,2)],[0,U(3,2)],'color','b','linewidth',2);

