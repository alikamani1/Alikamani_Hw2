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
dx = 0.01;
tau = 0.1;
x = 0:dx:L;
t = 0:tau:tend;
n = length(x);
m = length(t);
theta = zeros(m,n);
alpha = k/(rho*cp);
nou = (tau*alpha)/(dx^2);
gamma = (h*P*tau)/(a*rho*cp);
coef = 1+h*dx/k;
theta(1,:)=0;
theta(:,1) = 100;
for i = 2:m
    for j = 2:n
        if j<n
             if i==2  
                    theta(i,j) = nou*theta(i-1,j-1)+(1-2*nou-gamma)*theta(i-1,j)+nou*theta(i-1,j+1);
             elseif i>2 && i<m
                theta(i,j) = theta(i-2,j)+2*nou*theta(i-1,j-1)-(4*nou+2*gamma)*theta(i-1,j)+2*nou*theta(i-1,j+1);
               end
        else
            theta(i,j) = theta(i,j-1)/coef;
        end
    end
end

colormap hot
imagesc(x,t,theta)
colorbar
xlabel('Distance (meter)','interpreter','latex')
ylabel('Time (second)','interpreter','latex')
title('Heat Equation for $0 \le x \le 1m$ and $0 \le t \le 2 hour$','interpreter','latex')
% 
% x1 = 0.5;
% t1 = 7000;
% index_x = find(abs(x-x1)<0.01);
% index_t = find(abs(t-t1)<0.01);
% theta(index_t(1),index_x(1))