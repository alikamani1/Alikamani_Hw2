clc;clear;close all
%------------ Name ------------------%
disp('Name: Ali Kamani');
disp('Student No.: 400126111');
%------------ Problem Parameters ------------------%
P = 1;
k = 237;
cp = 897;
h = 25;
a = 0.0525;
rho = 2700;
tend = 2*3600;
L = 1;
dx = 0.001;
tau = 0.1;
x = 0:dx:L;
t = 0:tau:tend;
n = length(x);
m = length(t);
theta = zeros(m,n);
alpha = k/(rho*cp);
nou = (tau*alpha)/(dx^2);
gamma = (h*P*tau)/(a*rho*cp);
coef1 = 1+2*nou+gamma;
coef2 = 1+h*dx/k;
theta(1,:)= 0;
theta(:,1) = 100;
theta(:,2) = theta(:,2)+nou*100;

A = zeros(n,n);
A1 = sparse([0 nou/(2*nou+gamma) zeros(1,n-2)]);
A3 = sparse([zeros(1,n-2) -nou coef1]);
for i = 1:n-2
    if i == 1
        A2(i,[i i+1 i+2]) = sparse([0 coef1 -nou]);
    else
        A2(i,[i i+1 i+2]) = sparse([-nou coef1 -nou]);
    end
end
% A2(1,1) = A2(1,1)+nou;
A = [A1;A2;A3];
% A4 = [A2;A3];
inv_A = inv(A);
% aa(1:n-2)=-nou;
% bb(1:n-1)=1.+2.*nou+gamma;
% cc(1:n-2)=-nou;
% A2=sparse(diag(bb,0)+diag(aa,-1)+diag(cc,1));
% inv_A = inv(A2);

for i = 2:m
    theta(i-1,2) = theta(i-1,2)+nou*100;
    theta(i,:) = inv_A*theta(i-1,:)';
    theta(i,end) = theta(i,end-1)/coef2;
end


colormap hot
imagesc(x,t,theta)
colorbar
xlabel('Distance (meter)','interpreter','latex')
ylabel('Time (second)','interpreter','latex')
title('Heat Equation for $0 \le x \le 1m$ and $0 \le t \le 2 hour$','interpreter','latex')

x1 = 0.5;
t1 = 7000;
index_x = find(abs(x-x1)<0.01);
index_t = find(abs(t-t1)<0.01);
theta(index_t(1),index_x(1))