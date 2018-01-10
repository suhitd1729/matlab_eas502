% Question 1
clear all
clc

%% Part a
tspan = linspace(0.1,2)
% this divides the interval into 100 spaces between 0.1 and 2 
% for different values of initial value of tspan, the value at y(1) varies significantly 
% if tspan is linspace(0.1,2) then value at y(1) is about 3.7
% if tspan is linspace(0.01,2) then value at y(1) is about 37
% here tspan is chosen as linspace(0.1,2)
% the value obtained here is about 3.7 
size(tspan)
y0 = 1;
[t,y] = ode45(@(t,y) y*(-2*t + 1/t),tspan,y0);
plot(t,y,'-o')
xlabel("time")
ylabel("value of Y")
title("Plot of Y vs Time")



%% Part d
%representing F as alias for ln(Y) ,then Y is e^F 
F = @(t) -2*t + 1./t;
Q = quad(F,0.1,1); 
Y = exp(Q)
disp("The value obtained using this quadrature rule is " + Y);

%%
% trying to solve this ODE using dsolve 
% this does not return any solution: It says: "Explicit solution could not be found." 
syms y(t)
cond = y(0) == 1;
ode = diff(y,t) == y*(-2*t + 1/t)
ySol(t) = dsolve(ode,cond)


