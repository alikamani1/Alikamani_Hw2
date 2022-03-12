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
aal(1:n-2)=-nou;
bbl(1:n-1)=2.+2.*nou-gamma;
ccl(1:n-2)=-nou;
MMl=sparse(diag(bbl,0)+diag(aal,-1)+diag(ccl,1));
aar(1:n-2)=nou;
bbr(1:n-1)=2.-2.*nou+gamma;
ccr(1:n-2)=nou;
MMr=sparse(diag(bbr,0)+diag(aar,-1)+diag(ccr,1));
inv_MM1 = inv(MMl);
for i = 2:m
    theta(i,1:end-1) = inv_MM1*MMr*theta(i-1,1:end-1)';
    theta(i,end) = theta(i,end-1)/coef2;
    theta(i,1)=100;
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