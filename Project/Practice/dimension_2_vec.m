% 2차원에서 벡터를 직선에 투사하고 복원 %
clear; clc; close all;

p=0:0.1:15;     

x1=5*rand;      % random x1
y1=5*rand;      % random y1

x2=5*rand;      % random x2
y2=5*rand;      % random y2

% Generate vector %
vec_x=linspace(x1,x2,10);
vec_y=linspace(y1,y2,10);

% Plot vector %
plot(vec_x,vec_y)
axis([0 15 0 15])
hold on
scatter(x1,y1)
hold on
scatter(x2,y2)

% Generate vector b1,b2 % 
the1=rand*pi/2;
the2=rand*pi/2;

b1=sin(the1)/cos(the1); 
b2=sin(the2)/cos(the2);

% Plot vector b1,b2 %

grid on
hold on
plot(p,p*b1,'r','Linewidth',1.5)
hold on
plot(p,p*b2,'b','Linewidth',1.5)
% return

% Projection %

c1_1=(x1*sin(the1)-y1*cos(the1));       % Generate vector c1_1 for x1,y1 
c1_2=(x2*sin(the1)-y2*cos(the1));        % Generate vector c1_2 for x2,y2

c2_1=(x1*sin(the2)-y1*cos(the2));       % Generate vector c2_1 for x1,y1
c2_2=(x2*sin(the2)-y2*cos(the2));       % Generate vector c2_2 for x2,y2

b1_pro_1=(x1^2+y1^2-c1_1^2)^0.5;        % Length from origin of projected point b1 (x1,y1)
b1_pro_2=(x2^2+y2^2-c1_2^2)^0.5;        % Length from origin of projected point b1 (x2,y2)

b2_pro_1=(x1^2+y1^2-c2_1^2)^0.5;        % Length from origin of projected point b2 (x1,y1)
b2_pro_2=(x2^2+y2^2-c2_2^2)^0.5;        % Length from origin of projected point b2 (x2,y2)

x1_pro_1=b1_pro_1*cos(the1);            % x of projected point (b1_x1)
y1_pro_1=b1_pro_1*sin(the1);            % y of projected point (b1_y1)

x1_pro_2=b2_pro_1*cos(the2);            % x of projected point (b2_x1)
y1_pro_2=b2_pro_1*sin(the2);            % y of projected point (b2_y1)

x2_pro_1=b1_pro_2*cos(the1);            % x of projected point (b1_x2)
y2_pro_1=b1_pro_2*sin(the1);            % y of projected point (b1_y2)

x2_pro_2=b2_pro_2*cos(the2);            % x of projected point (b2_x2)
y2_pro_2=b2_pro_2*sin(the2);            % y of projected point (b2_y2)

% projected vector generation %
vec_1_pro1x=linspace(x1_pro_1,x2_pro_1,10);
vec_2_pro2x=linspace(x1_pro_2,x2_pro_2,10);
vec_1_pro1y=linspace(y1_pro_1,y2_pro_1,10);
vec_2_pro2y=linspace(y1_pro_2,y2_pro_2,10);

% Plot projected vector %

hold on

plot(vec_1_pro1x,vec_1_pro1y,'k','Linewidth',1.5)
plot(vec_2_pro2x,vec_2_pro2y,'k','Linewidth',1.5)
% return
x1y1=[cos(the1) sin(the1);cos(the2) sin(the2)]\[b1_pro_1;b2_pro_1];
x1_n=x1y1(1); y1_n=x1y1(2);

x2y2=[cos(the1) sin(the1);cos(the2) sin(the2)]\[b1_pro_2;b2_pro_2];
x2_n=x2y2(1); y2_n=x2y2(2);

hold on
scatter(x1_n,y1_n,15,'k','filled')
hold on
scatter(x2_n,y2_n,15,'k','filled')
% return
x1x2_n=linspace(x1_n,x2_n,10);
y1y2_n=linspace(y1_n,y2_n,10);

hold on
plot(x1x2_n,y1y2_n,'o')
