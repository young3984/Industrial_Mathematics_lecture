% 3차원 곡선을 평면에 투사하고 복원 %
clear; clc; close all;

subplot(2,3,[1,4]);
t=0:0.1:30;
x=sin(t);
y=cos(t);
z=t;

% t = 0:pi/500:pi;
% x = sin(t).*cos(10*t);
% y = sin(t).*sin(10*t);
% z = cos(t);

% t=-10:0.1:10;
% 
% x = exp(-t/10).*sin(5*t);
% y = exp(-t/10).*cos(5*t);
% z = t;

plot3(x,y,z);           % 원본 데이터 그리기
box on
grid on
real=[x' y' z'];        % 원본 데이터 설정

subplot(2,3,2);

the1=rand*pi/2;     % the1 각
phi1=rand*pi/2;     % phi1 각

b1=[cos(the1)*cos(phi1)
    sin(the1)*cos(phi1)
    sin(phi1)];         % b1 벡터      
bx1=[-sin(the1)*cos(phi1)-cos(the1)*sin(phi1)
    cos(the1)*cos(phi1)-sin(the1)*sin(phi1)
    cos(phi1)];         % bx1 벡터

by1=cross(b1,bx1);
% by1=[sin(the1)-sin(phi1)*cos(the1)*cos(phi1)
%     -cos(the1)-sin(the1)*sin(phi1)*cos(phi1)
%     cos(phi1)^2-sin(the1)*sin(phi1)*cos(phi1)+...
%     sin(the1)*sin(phi1)*cos(phi1)];     % by1 벡터


mDataX1=real*bx1/sum(bx1.^2);       % bx1 벡터에 투사한 좌표
mDataY1=real*by1/sum(by1.^2);       % by1 벡터에 투사한 좌표

plot(mDataX1,mDataY1,'b');     % bx1 벡터와 by1벡터의 좌표로 그리기
title(sprintf('%1.0f %1.0f',the1*180/pi,phi1*180/pi));

subplot(2,3,5)

the2=rand*pi/2;     % the2 각
phi2=rand*pi/2;     % phi2 각

b2=[cos(the2)*cos(phi2)
    sin(the2)*cos(phi2)
    sin(phi2)];         % b2 벡터
bx2=[-sin(the2)*cos(phi2)-cos(the2)*sin(phi2)
    cos(the2)*cos(phi2)-sin(the2)*sin(phi2)
    cos(phi2)];         % bx1 벡터

by2=cross(b2,bx2);

% by2=[sin(the2)-sin(phi2)*cos(the2)*cos(phi2)
%     -cos(the2)-sin(the2)*sin(phi2)*cos(phi2)
%     cos(phi2)^2-sin(the2)*sin(phi2)*cos(phi2)+...
%     sin(the2)*sin(phi2)*cos(phi2)];     % by1 벡터

mDataX2=real*bx2/sum(bx2.^2);       % bx2 벡터에 투사한 좌표      
mDataY2=real*by2/sum(by2.^2);       % by2 벡터에 투사한 좌표

plot(mDataX2,mDataY2,'b');     % bx2 벡터와 by2 벡터의 좌표로 그리기 
title(sprintf('%1.0f %1.0f',the2*180/pi,phi2*180/pi));

subplot(2,3,[3,6])

B=[bx1 by1 bx2 by2];
b=[sum(bx1.^2)*mDataX1  sum(by1.^2)*mDataY1 ...
    sum(bx2.^2)*mDataX2  sum(by2.^2)*mDataY2];

make=B'\b';

plot3(make(1,:),make(2,:),make(3,:))        % 투사한 데이터 그리기
box on
grid on
