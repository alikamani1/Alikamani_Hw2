clc;clear;close all
global p k cp h a  rho
p = 1;
k = 237;
cp = 897;
h = 25;
a = 0.0525;
rho = 2700;
tend = 2*3600;
m = 0;
L = 1;
dx = 0.1;
x = 0:0.1:L;
t = linspace(0,tend,10*tend);
sol =pdepe(m,@pdex1pde,@pdex1ic,@pdex1bc,x,t);
temprature=sol(:,:);
colormap hot
imagesc(x,t,sol)
colorbar
xlabel('Distance (meter)','interpreter','latex')
ylabel('Time (second)','interpreter','latex')
title('Heat Equation for $0 \le x \le 1m$ and $0 \le t \le 2 hour$','interpreter','latex')

%%
x1 = 0.5;
t1 = 7000;
index_x = find(abs(x-x1)<0.01);
index_t = find(abs(t-t1)<0.01);
theta = sol(index_t(1),index_x(1))