function[c,f,s]=pdex1pde(x,t,u,dudx)
global p k cp h a rho
c = rho*cp;
f = k*dudx;
s = -(h*p)/a*u;
% s = 0;
end