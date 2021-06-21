% 포식자 피식자 모델
clear; clc; clf;

alpha=4/7; beta=2; delta=3/2; gamma=-5/6; dt=0.001;
n=30000;
x=linspace(0,n,n);
u=zeros(1,n);
v=zeros(1,n);

u(1)=0.35; v(1)=0.5;


for ik=1:n-1
    u(ik+1)=u(ik)+dt*(alpha*u(ik)-beta*u(ik)*v(ik));
    v(ik+1)=v(ik)+dt*(delta*u(ik)*v(ik)-gamma*v(ik));  
    
%     plot(dt*(0:n-1),u,'b--.','LineWidth',1.5);
%     hold on
%     plot(dt*(0:n-1),v,'r--.','LineWidth',1.5);
%     hold off
%     drawnow
end

subplot(2,1,1)
plot(x,u,'b--.','LineWidth',1.5);
hold on
plot(x,v,'r--.','LineWidth',1.5);

subplot(2,1,2)
plot(u,v)
