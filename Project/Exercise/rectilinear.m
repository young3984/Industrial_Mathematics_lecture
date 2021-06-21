clear; clc; close all;

p=-1:0.01:1;
k=ones(size(p'));
q=-ones(size(p'));

xx=[k;q;p';p'];
yy=[p';p';k;q];
nn=4*(size(p',1));
t=0:1/nn:1;

the1=rand*pi/2;                                     % the1 각
phi1=rand*pi/2;                                     % phi1 각

b1=[cos(the1)*cos(phi1)
    sin(the1)*cos(phi1)
    sin(phi1)];                                     % b1 벡터      
bx1=[-sin(the1)*cos(phi1)-cos(the1)*sin(phi1)
    cos(the1)*cos(phi1)-sin(the1)*sin(phi1)
    cos(phi1)];                                     % bx1 벡터

by1=cross(b1,bx1);                                  % bx2 벡터

the2=rand*pi/2;                                     % the2 각
phi2=rand*pi/2;                                     % phi2 각

b2=[cos(the2)*cos(phi2)
    sin(the2)*cos(phi2)
    sin(phi2)];                                     % b2 벡터
bx2=[-sin(the2)*cos(phi2)-cos(the2)*sin(phi2)
    cos(the2)*cos(phi2)-sin(the2)*sin(phi2)
    cos(phi2)];                                     % bx1 벡터

by2=cross(b2,bx2);                                  % bx2 벡터

% 오리지널 원기둥 그리기%
for ik=1:nn  
    subplot(2,3,[1,4]);
    
    k=xx(ik)*ones(size(t'));                        % 직육면체를 이루는 선분의 x 좌표
    p=yy(ik)*ones(size(t'));                        % 직육면체를 이루는 선분의 y 좌표
    
    g=-1:2/(nn):1;
    h=ones(1,nn+1)';
    
    plot3(k,g',h*0,'b')
    hold on
    plot3(k,g,h,'b')
    hold on
    plot3(k,p,t,'b')                                % 직육면체 그리기
    box on
    grid on
    hold on
    axis([-2 2 -2 2 0 2]) 

    % 투사시키기%

    real=[k p t'];                                  % 실제 데이터 넣기
    
    real_up=[k g' h];
    real_d=[k g' h*0];
    
    subplot(2,3,2);
    
    mDataX1=real*bx1/sum(bx1.^2);                   % bx1 벡터에 투사한 좌표
    mDataY1=real*by1/sum(by1.^2);                   % by1 벡터에 투사한 좌표
    
    mDataX1_up=real_up*bx1/sum(bx1.^2);                   % bx1 벡터에 투사한 좌표
    mDataY1_up=real_up*by1/sum(by1.^2);                   % by1 벡터에 투사한 좌표
    mDataX1_d=real_d*bx1/sum(bx1.^2);                   % bx1 벡터에 투사한 좌표
    mDataY1_d=real_d*by1/sum(by1.^2);                   % by1 벡터에 투사한 좌표
    
    plot(mDataX1,mDataY1,'b');                      % bx1 벡터와 by1벡터의 좌표로 그리기
    hold on
    plot(mDataX1_up,mDataY1_up,'b');
    hold on
    plot(mDataX1_d,mDataY1_d,'b');
    title(sprintf('%1.0f %1.0f',the1*180/pi,phi1*180/pi));
    hold on
    
    subplot(2,3,5)
    
    mDataX2=real*bx2/sum(bx2.^2);                   % bx2 벡터에 투사한 좌표      
    mDataY2=real*by2/sum(by2.^2);                   % by2 벡터에 투사한 좌표
    
    mDataX2_up=real_up*bx2/sum(bx2.^2);                 % bx2 벡터에 투사한 좌표      
    mDataY2_up=real_up*by2/sum(by2.^2);                 % by2 벡터에 투사한 좌표
    mDataX2_d=real_d*bx2/sum(bx2.^2);                   % bx2 벡터에 투사한 좌표      
    mDataY2_d=real_d*by2/sum(by2.^2);                   % by2 벡터에 투사한 좌표
    
    plot(mDataX2,mDataY2,'b');                      % bx2 벡터와 by2 벡터의 좌표로 그리기
    hold on
    plot(mDataX2_up,mDataY2_up,'b');                      % bx2 벡터와 by2 벡터의 좌표로 그리기
    hold on
    plot(mDataX2_d,mDataY2_d,'b');                      % bx2 벡터와 by2 벡터의 좌표로 그리기
    title(sprintf('%1.0f %1.0f',the2*180/pi,phi2*180/pi));
    
    hold on
    
    subplot(2,3,[3,6])
    B=[bx1 by1 bx2 by2];
    b=[sum(bx1.^2)*mDataX1  sum(by1.^2)*mDataY1 ...
        sum(bx2.^2)*mDataX2  sum(by2.^2)*mDataY2];
    b_up=[sum(bx1.^2)*mDataX1_up  sum(by1.^2)*mDataY1_up ...
        sum(bx2.^2)*mDataX2_up  sum(by2.^2)*mDataY2_up];
    b_d=[sum(bx1.^2)*mDataX1_d  sum(by1.^2)*mDataY1_d ...
        sum(bx2.^2)*mDataX2_d  sum(by2.^2)*mDataY2_d];

    make=B'\b';
    make_up=B'\b_up';
    make_d=B'\b_d';

    plot3(make(1,:),make(2,:),make(3,:),'b')        % 투사한 데이터 그리기
    hold on
    plot3(make_up(1,:),make_up(2,:),make_up(3,:),'b')        % 투사한 데이터 그리기
    hold on
    plot3(make_d(1,:),make_d(2,:),make_d(3,:),'b')        % 투사한 데이터 그리기
    
    box on
    grid on
    axis([-2 2 -2 2 0 2]) 
end    
