% 2차원에서 점을 직선에 투사하고 복원 %
clear; clc; close all;

p=0:0.1:15;             % 2차원 좌표 만들기

the1=rand*pi/2;         % the1 설정
the2=rand*pi/2;         % the2 설정

b1=sin(the1)/cos(the1); % 직선의 기울기
b2=sin(the2)/cos(the2); % 직선의 기울기

x=10*rand;              % random x 설정
y=10*rand;              % random y 설정

scatter(x,y,'b');       % original (x,y)좌표 찍어보기
% return
grid on                 % grid 설정
axis([0 15 0 15])       % 보고 싶은 그래프 범위 설정
hold on
plot(p,p*b1,'r','Linewidth',1.5)        % b1벡터의 직선 그리기 
hold on
plot(p,p*b2,'b','Linewidth',1.5)        % b2벡터의 직선 그리기 

% return
c1=(x*sin(the1)-y*cos(the1));           % 투사된 점을 그리기 위한 c1벡터의 크기
c2=(x*sin(the2)-y*cos(the2));           % 투사된 점을 그리기 위한 c2벡터의 크기

b1_pro=(x^2+y^2-c1^2)^0.5;              % 투사된 점의 원점으로부터의 길이
b2_pro=(x^2+y^2-c2^2)^0.5;              % 투사된 점의 원점으로부터의 길이

hold on 
scatter(b1_pro*cos(the1),b1_pro*sin(the1));     % 투사된 점 그리기
hold on
scatter(b2_pro*cos(the2),b2_pro*sin(the2));     % 투사된 점 그리기

legend('original','b1','b2','projection1','projection2');
% return
xy=[cos(the1) sin(the1);cos(the2) sin(the2)]\[b1_pro;b2_pro];       % 다시 복원시키기
x_n=xy(1); y_n=xy(2);               % 새로운 x, y 값 대입

scatter(x_n,y_n,15,'k','filled')    % 그래프로 그려서 확인
