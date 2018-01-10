%Q17
clear all
clc
tspan = [0 10];
y0 = [0 18.3];
[x,y] = ode45(@(x1,y1) odefcn(x1,y1),tspan,y0);
plot(x,y(:,1),'-o',x,y(:,2),'-.')