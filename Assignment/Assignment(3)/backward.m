clear; clc; close all

nx=100; xlength=1; h=xlength/nx;
x=0.5*h:h:xlength-0.5*h;

u=ones(1,nx);
c=sin(pi*x); nc=c;
dt=0.1*h;

plot(x,c,'.-');



for it=1:1000
    nc(1)=c(1)-dt*u(1)*(c(2)-c(nx))/(2*h);
    for ix=2:nx-1
        nc(ix)=c(ix)-dt*(u(ix)*c(ix)-c(ix-1))/(h);        
    end    
    nc(nx)=c(nx)-dt*u(nx)*(c(1)-c(nx-1))/(h);
    
    c=nc;
    plot(x,c,'.-')
    axis([0 1 0 2]);
    drawnow;    
end    
