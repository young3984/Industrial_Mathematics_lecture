clear; clc; close all;

[x,y,z]=sphere(50);       %구를 50*50인 면으로 만드는 것

the1=rand*pi/2;     % the1 각
phi1=rand*pi/2;     % phi1 각

b1=[cos(the1)*cos(phi1)
    sin(the1)*cos(phi1)
    sin(phi1)];         % b1 벡터      
bx1=[-sin(the1)*cos(phi1)-cos(the1)*sin(phi1)
    cos(the1)*cos(phi1)-sin(the1)*sin(phi1)
    cos(phi1)];         % bx1 벡터

by1=cross(b1,bx1);      % bx2 벡터

the2=rand*pi/2;     % the2 각
phi2=rand*pi/2;     % phi2 각

b2=[cos(the2)*cos(phi2)
    sin(the2)*cos(phi2)
    sin(phi2)];         % b2 벡터
bx2=[-sin(the2)*cos(phi2)-cos(the2)*sin(phi2)
    cos(the2)*cos(phi2)-sin(the2)*sin(phi2)
    cos(phi2)];         % bx1 벡터

by2=cross(b2,bx2);      % bx2 벡터

% 오리지널 구 그리기

for ik=1:51
    subplot(2,3,[1,4]);
    
    X=x(ik,:)';                          % 구를 이루는 x 좌표
    Y=y(ik,:)';                          % 구를 이루는 y 좌표
    Z=z(ik,:)';                          % 구를 이루는 z 좌표
    
    plot3(X,Y,Z,'.b')                      % 구 그리기
    box on
    grid on
    hold on
end
% 투사시키기
for ik=1:51
    X=x(ik,:)';                          % 구를 이루는 x 좌표
    Y=y(ik,:)';                          % 구를 이루는 y 좌표
    Z=z(ik,:)';                          % 구를 이루는 z 좌표
    
    real=[X Y Z];                         % 실제 데이터 넣기
    
    subplot(2,3,2);
    
    mDataX1=real*bx1/sum(bx1.^2);       % bx1 벡터에 투사한 좌표
    mDataY1=real*by1/sum(by1.^2);       % by1 벡터에 투사한 좌표
    
    plot(mDataX1,mDataY1,'.b');          % bx1 벡터와 by1벡터의 좌표로 그리기
    
    title(sprintf('%1.0f %1.0f',the1*180/pi,phi1*180/pi));
    hold on
    
    subplot(2,3,5)
    
    mDataX2=real*bx2/sum(bx2.^2);       % bx2 벡터에 투사한 좌표      
    mDataY2=real*by2/sum(by2.^2);       % by2 벡터에 투사한 좌표

    plot(mDataX2,mDataY2,'.b');          % bx2 벡터와 by2 벡터의 좌표로 그리기 
    title(sprintf('%1.0f %1.0f',the2*180/pi,phi2*180/pi));
    
    hold on
end
for ik=1:51
    X=x(ik,:)';
    Y=y(ik,:)';
    Z=z(ik,:)';
    
    real=[X Y Z];
    
    mDataX1=real*bx1/sum(bx1.^2);       % bx1 벡터에 투사한 좌표
    mDataY1=real*by1/sum(by1.^2);       % by1 벡터에 투사한 좌표
    
    mDataX2=real*bx2/sum(bx2.^2);       % bx2 벡터에 투사한 좌표      
    mDataY2=real*by2/sum(by2.^2);       % by2 벡터에 투사한 좌표
    hold on
    subplot(2,3,[3,6])

    B=[bx1 by1 bx2 by2];
    b=[sum(bx1.^2)*mDataX1  sum(by1.^2)*mDataY1 ...
        sum(bx2.^2)*mDataX2  sum(by2.^2)*mDataY2];

    make=B'\b';

    plot3(make(1,:),make(2,:),make(3,:),'.b')        % 복원시킨 데이터로 구 그리기
    box on
    grid on
    axis([-1 1 -1 1 -1 1]) 
    
    
end   