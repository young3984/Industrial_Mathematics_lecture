clear; clc; close all;

data=load('poketmon.txt');
tt=data(:,3:4);
data=data(:,1:2);
data=[data;tt];
data=data(2:100,1:2);

x=data(:,1);        % split data
y=data(:,2);        % split data

lnx=log(x);
lny=log(y);

lnx_sum=sum(lnx); lnx2_sum=sum(lnx.^2); lny_sum=sum(lny); xy_sum=sum(lnx.*lny); 

lnb=(lnx2_sum*lny_sum-xy_sum*lnx_sum)/(99*lnx2_sum-lnx_sum^2);
a=(99*xy_sum-lnx_sum*lny_sum)/(99*lnx2_sum-lnx_sum^2);

b=exp(lnb);
plot(data(:,1),data(:,2),'.')
hold on
plot(x,b*x.^a);%plot(x,b*exp(a*log(x)));
axis([0 100 0 max(data(:,2))])
legend('Real','Least Squares');
% hold off
% plot(x,lny)
% hold on
% plot(x,a*x+lnb);



