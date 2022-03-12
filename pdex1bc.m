function [pl,ql,pr,qr]=pdex1bc(xl,ul,xr,ur,t)
global h
pl=ul-100;
ql = 0;
pr=h*ur;
qr = 1;
end